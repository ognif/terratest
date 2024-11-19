locals {
  aws_ebs_csi_addon_name = "aws-ebs-csi-driver"
  aws_ebs_csi_namespace  = "kube-system"
  # This service account is automatically created by the add-on.
  aws_ebs_csi_service_account = "ebs-csi-controller-sa"
}

data "aws_eks_addon_version" "aws_ebs_csi_driver" {
  addon_name         = local.aws_ebs_csi_addon_name
  kubernetes_version = var.addon_context.eks_cluster_version
}

resource "aws_eks_addon" "aws_ebs_csi_driver" {
  cluster_name                = var.addon_context.eks_cluster_id
  addon_name                  = local.aws_ebs_csi_addon_name
  addon_version               = data.aws_eks_addon_version.aws_ebs_csi_driver.version
  service_account_role_arn    = aws_iam_role.ebs_csi_driver_role.arn
  preserve                    = true
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  tags                        = var.addon_context.tags
  configuration_values        = file("${path.module}/templates/ebs_values.yaml")
}

resource "aws_iam_role" "ebs_csi_driver_role" {
  name        = format("%s-%s-%s", var.addon_context.eks_cluster_id, trimsuffix(local.aws_ebs_csi_service_account, "-sa"), "irsa")
  description = "AWS IAM Role for the Kubernetes service account ${local.aws_ebs_csi_service_account}."

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:${var.addon_context.aws_partition_id}:iam::${var.addon_context.aws_caller_identity_account_id}:oidc-provider/${var.addon_context.eks_oidc_issuer_url}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringLike" : {
            "${var.addon_context.eks_oidc_issuer_url}:sub" : "system:serviceaccount:${local.aws_ebs_csi_namespace}:${local.aws_ebs_csi_service_account}",
            "${var.addon_context.eks_oidc_issuer_url}:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })

  force_detach_policies = true

  tags = var.addon_context.tags
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi_driver_role.name
}


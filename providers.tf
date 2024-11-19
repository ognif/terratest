data "aws_eks_cluster" "cluster" {
  name = module.eks.eks_cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.eks_cluster_id
}

provider "aws" {
  profile = "change_me"
  region  = "change_me"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)

  # https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#exec-plugins
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--profile", "change_me", "--cluster-name", data.aws_eks_cluster.cluster.name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token

    # Uncomment if you run into Helm timeout issues on Linux
    #exec {
    #  api_version = "client.authentication.k8s.io/v1beta1"
    #  args        = ["eks", "--profile=change_me", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
    #  command     = "aws"
    #}
  }
}

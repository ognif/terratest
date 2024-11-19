variable "addon_context" {
  description = "AWS and EKS metadata"
  type        = any
}

variable "ingress_nginx_config" {
  description = "Ingress Nginx configuration"
  type = object({
    enable          = bool
    helm_repository = string
    helm_version    = string
    chart_values    = string
    subnets_ids     = list(string)
  })
}

variable "cluster_autoscaler_config" {
  description = "Cluster Autoscaler configuration."
  type = object({
    enable          = bool
    helm_repository = string
    helm_version    = string
    chart_values    = string
  })
}

variable "coredns_config" {
  type = object({
    enable               = optional(bool, true)
    configuration_values = optional(string, null)
  })
  description = "Input configuration for AWS EKS add-on coredns."
}

variable "s3_csi_config" {
  type = object({
    enable               = optional(bool, false)
    configuration_values = optional(string, null)
  })
  description = "Input configuration for AWS EKS add-on aws-mountpoint-s3-csi-driver."
}

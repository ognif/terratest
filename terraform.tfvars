
# Global cloudwatch retention period for the EKS, VPC, SSM, and PostgreSQL logs.
cloudwatch_retention = 7

# Input configuration for cluster-autoscaler deployed with helm release.
# By setting key 'enable' to 'true', cluster-autoscaler release will be deployed.
# 'helm_repository' is an URL for the repository of cluster-autoscaler helm chart, where 'helm_version' is its respective version of a chart.
# 'chart_values' is used for changing default values.yaml of a cluster-autoscaler chart.
cluster_autoscaler_config = {}

# Download link for codemeter rpm package.
codemeter = "https://www.wibu.com/support/user/user-software/file/download/13346.html?tx_wibudownloads_downloadlist%5BdirectDownload%5D=directDownload&tx_wibudownloads_downloadlist%5BuseAwsS3%5D=0&cHash=8dba7ab094dec6267346f04fce2a2bcd"

# Input configuration for AWS EKS add-on coredns.
# By setting key 'enable' to 'true', coredns add-on is deployed.
# Key 'configuration_values' is used to change add-on configuration.
# Its content should follow add-on configuration schema (see https://aws.amazon.com/blogs/containers/amazon-eks-add-ons-advanced-configuration/).
coredns_config = {
  "enable": true
}

# Specifies if ECR pull through cache rule and accompanying resources will be created.
# Key 'enable' indicates whether pull through cache rule needs to be enabled for the cluster.
# When 'enable' is set to 'true', key 'exist' indicates whether pull through cache rule already exists for region's private ECR.
# If key 'enable' is set to 'true', IAM policy will be attached to the cluster's nodes.
# Additionally, if 'exist' is set to 'false', credentials for upstream registry and pull through cache rule will be created.
ecr_pullthrough_cache_rule_config = {
  "enable": false,
  "exist": false
}

# Install FluentBit to send container logs to CloudWatch.
enable_aws_for_fluentbit = false

enable_ivs = false

# Scans license server EC2 instance and EKS nodes for updates.
# Installs patches on license server automatically.
# EKS nodes need to be updated manually.
enable_patching = false

# The maximum number of nodes for gpu job execution
gpuNodeCountMax = 12

# The minimum number of nodes for gpu job execution
gpuNodeCountMin = 0

# The disk size in GiB of the nodes for the gpu job execution
gpuNodeDiskSize = 100

# Specifies whether an additional node pool for gpu job execution is added to the kubernetes cluster
gpuNodePool = false

# The machine size of the nodes for the gpu job execution
gpuNodeSize = [
  "g5.2xlarge"
]

# The NVIDIA driver version for GPU node group.
gpuNvidiaDriverVersion = "535.54.03"

# The name of the infrastructure. e.g. simphera-infra
infrastructurename = "simphera"

# Input configuration for ingress-nginx service deployed with helm release.
# By setting key 'enable' to 'true', ingress-nginx service will be deployed.
# 'helm_repository' is an URL for the repository of ingress-nginx helm chart, where 'helm_version' is its respective version of a chart.
# 'chart_values' is used for changing default values.yaml of an ingress-nginx chart.
ingress_nginx_config = {
  "enable": false
}

# 6-field Cron expression describing the install maintenance schedule. Must not overlap with variable scan_schedule.
install_schedule = "cron(0 3 * * ? *)"

# The maximum number of GPU nodes nodes for IVS jobs
ivsGpuNodeCountMax = 2

# The minimum number of GPU nodes nodes for IVS jobs
ivsGpuNodeCountMin = 0

# The disk size in GiB of the nodes for the IVS gpu job execution
ivsGpuNodeDiskSize = 100

# Specifies whether an additional node pool for IVS gpu job execution is added to the kubernetes cluster
ivsGpuNodePool = false

# The machine size of the GPU nodes for IVS jobs
ivsGpuNodeSize = [
  "g4dn.2xlarge"
]

# The kubernetes version of the EKS cluster.
kubernetesVersion = "1.30"

# Specifies whether a license server VM will be created.
licenseServer = false

# The maximum number of Linux nodes for the job execution
linuxExecutionNodeCountMax = 10

# The minimum number of Linux nodes for the job execution
linuxExecutionNodeCountMin = 0

# The disk size in GiB of the nodes for the job execution
linuxExecutionNodeDiskSize = 200

# The machine size of the Linux nodes for the job execution, user must check the availability of the instance types for the region.
# The list is ordered by priority where the first instance type gets the highest priority.
# Instance types must fulfill the following requirements: 64 GB RAM, 16 vCPUs, at least 110 IPs, at least 2 availability zones.
linuxExecutionNodeSize = [
  "m6a.4xlarge",
  "m5a.4xlarge",
  "m5.4xlarge",
  "m6i.4xlarge",
  "m4.4xlarge",
  "m7i.4xlarge",
  "m7a.4xlarge"
]

# The maximum number of Linux nodes for the regular services
linuxNodeCountMax = 12

# The minimum number of Linux nodes for the regular services
linuxNodeCountMin = 1

# The disk size in GiB of the nodes for the regular services
linuxNodeDiskSize = 200

# The machine size of the Linux nodes for the regular services, user must check the availability of the instance types for the region.
# The list is ordered by priority where the first instance type gets the highest priority.
# Instance types must fulfill the following requirements: 64 GB RAM, 16 vCPUs, at least 110 IPs, at least 2 availability zones.
linuxNodeSize = [
  "m6a.4xlarge",
  "m5a.4xlarge",
  "m5.4xlarge",
  "m6i.4xlarge",
  "m4.4xlarge",
  "m7i.4xlarge",
  "m7a.4xlarge"
]

# How long in hours for the maintenance window.
maintainance_duration = 3

# Additional AWS account numbers to add to the aws-auth ConfigMap
map_accounts = []

# Additional IAM roles to add to the aws-auth ConfigMap
map_roles = []

# Additional IAM users to add to the aws-auth ConfigMap
map_users = []

# List of IDs for the private subnets.
private_subnet_ids = []

# List of IDs for the public subnets.
public_subnet_ids = []

# Download link for RTMaps license server.
rtMaps_link = "http://dl.intempora.com/RTMaps4/rtmaps_4.9.0_ubuntu1804_x86_64_release.tar.bz2"

# Input configuration for AWS EKS add-on aws-mountpoint-s3-csi-driver.
# By setting key 'enable' to 'true', aws-mountpoint-s3-csi-driver add-on is deployed.
# Key 'configuration_values' is used to change add-on configuration.
# Its content should follow add-on configuration schema (see https://aws.amazon.com/blogs/containers/amazon-eks-add-ons-advanced-configuration/).
s3_csi_config = {
  "enable": false
}

# 6-field Cron expression describing the scan maintenance schedule. Must not overlap with variable install_schedule.
scan_schedule = "cron(0 0 * * ? *)"

# A list containing the individual SIMPHERA instances, such as 'staging' and 'production'.
simpheraInstances = {
  "production": {
    "backup_retention": 35,
    "db_instance_type_keycloak": "db.t4g.large",
    "db_instance_type_simphera": "db.t4g.large",
    "enable_backup_service": true,
    "enable_deletion_protection": true,
    "enable_keycloak": true,
    "k8s_namespace": "simphera",
    "name": "production",
    "postgresqlApplyImmediately": false,
    "postgresqlMaxStorage": 100,
    "postgresqlMaxStorageKeycloak": 100,
    "postgresqlStorage": 20,
    "postgresqlStorageKeycloak": 20,
    "postgresqlVersion": "16",
    "secretname": "aws-simphera-dev-production"
  }
}

# The tags to be added to all resources.
tags = {}

# The CIDR for the virtual private cluster.
vpcCidr = "10.1.0.0/18"

# The ID of preconfigured VPC. Change from 'null' to use already existing VPC.
vpcId = null

# List of CIDRs for the private subnets.
vpcPrivateSubnets = [
  "10.1.0.0/22",
  "10.1.4.0/22",
  "10.1.8.0/22"
]

# List of CIDRs for the public subnets.
vpcPublicSubnets = [
  "10.1.12.0/22",
  "10.1.16.0/22",
  "10.1.20.0/22"
]

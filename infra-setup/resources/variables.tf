
variable "general" {
  type        = "map"
  description = "Global parameters"
  default = {
    region = "australia-southeast1"
    zone = "australia-southeast1-a"
    name = "demo-k8s"
  }
}


# Parameters authorized:
# network (default: default)
# subnetwork (default: default)
# disable_horizontal_pod_autoscaling (default: false)
# disable_http_load_balancing (default: false)
# disable_kubernetes_dashboard (default: false)
# disable_network_policy_config (default: true)
# enable_kubernetes_alpha (default: false)
# enable_legacy_abac (default: false)
# maintenance_window (default: 4:30)
# version (default: Data resource)
# monitoring_service (default: none)
# logging_service (default: logging.googleapis.com)
variable "master" {
  type        = "map"
  description = "Kubernetes master parameters to initialize"
  default = {
    network = "demo-network"
    subnetwork = "demo-subnetwork"
    version = "1.11.6-gke.11"
  }  
}


# Parameters authorized:
# node_count (default: 2)
# remove (default: false)
# disk_size_gb (default: 10)
# disk_type (default: pd-standard)
# image (default: COS)
# local_ssd_count (default: 0)
# oauth_scopes (default: https://www.googleapis.com/auth/compute,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring)
# machine_type (default: n1-standard-4)
# preemptible (default: false)
# service_account (default: default)
variable "default_node_pool" {
  type        = "map"
  default     = {
    service_account = "demo-k8s@genial-broker-231710.iam.gserviceaccount.com"
    node_count = 1
    machine_type = "n1-standard-4"
  }
  description = "Default pool setting"
  
}


# https://www.terraform.io/docs/providers/google/r/container_cluster.html#tags
variable "tags" {
  type        = "list"
  default     = ["demo","demo-k8s"]
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#labels
variable "labels" {
  description = "The Kubernetes labels (key/value pairs) to be applied to each node"
  type        = "map"
  default     = {}
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#additional_zones
variable "node_additional_zones" {
  type        = "list"
  default     = []
  description = "The list of additional Google Compute Engine locations in which the cluster's nodes should be located. If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#ip_allocation_policy
variable "ip_allocation_policy" {
  type        = "list"
  default     = []
  description = "Configuration for cluster IP allocation. As of now, only pre-allocated subnetworks (custom type with secondary ranges) are supported"
}
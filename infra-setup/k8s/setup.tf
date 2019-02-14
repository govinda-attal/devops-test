resource "google_container_cluster" "demo-k8s" {
  name        = "${var.general["name"]}"
  description = "Kubernetes ${var.general["name"]} in ${var.general["zone"]}"
  zone        = "${var.general["zone"]}"
  # region - Conflict zone

  network                  = "${lookup(var.master, "network", "default")}"
  subnetwork               = "${lookup(var.master, "subnetwork", "default")}"
  initial_node_count       = "${lookup(var.default_node_pool, "node_count", 2)}"
  remove_default_node_pool = "${lookup(var.default_node_pool, "remove", false)}"
  
  addons_config {
    horizontal_pod_autoscaling {
      disabled = "${lookup(var.master, "disable_horizontal_pod_autoscaling", false)}"
    }

    http_load_balancing {
      disabled = "${lookup(var.master, "disable_http_load_balancing", false)}"
    }

    kubernetes_dashboard {
      disabled = "${lookup(var.master, "disable_kubernetes_dashboard", false)}"
    }

    network_policy_config {
      disabled = "${lookup(var.master, "disable_network_policy_config", true)}"
    }
  }
  
  # cluster_ipv4_cidr - default 
  enable_kubernetes_alpha = "${lookup(var.master, "enable_kubernetes_alpha", true)}"
  enable_legacy_abac      = "${lookup(var.master, "enable_legacy_abac", false)}"
  ip_allocation_policy    = "${var.ip_allocation_policy}"
  
  # master_authorized_networks_config - disable (security)
  min_master_version = "${var.master["version"]}"
  node_version       = "${var.master["version"]}"
  monitoring_service = "${lookup(var.master, "monitoring_service", "none")}"
  logging_service    = "${lookup(var.master, "logging_service", "logging.googleapis.com")}"
  
  node_config {
    disk_size_gb    = "${lookup(var.default_node_pool, "disk_size_gb", 10)}"
    disk_type       = "${lookup(var.default_node_pool, "disk_type", "pd-standard")}"
    image_type      = "${lookup(var.default_node_pool, "image", "COS")}"
    local_ssd_count = "${lookup(var.default_node_pool, "local_ssd_count", 0)}"
    machine_type    = "${lookup(var.default_node_pool, "machine_type", "n1-standard-1")}"
    
    oauth_scopes    = ["${split(",", lookup(var.default_node_pool, "oauth_scopes", "https://www.googleapis.com/auth/compute,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring"))}"]
    service_account = "${lookup(var.default_node_pool, "service_account", "default")}"
    labels          = "${var.labels}"
    tags            = "${var.tags}"
  }
}
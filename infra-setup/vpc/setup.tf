resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "${var.master["subnetwork"]}"
  ip_cidr_range = "10.2.0.0/16"
  region        = "australia-southeast1"
  network       = "${google_compute_network.demo-network.self_link}"
}

resource "google_compute_network" "demo-network" {
  name                    = "${var.master["network"]}"
  auto_create_subnetworks = false
}


variable "master" {
  type        = "map"
  description = "Network master parameters to initialize"
  default = {
    network = "demo-network"
    subnetwork = "demo-subnetwork"
  } 
}

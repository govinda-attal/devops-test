provider "google" {
  credentials = "${file("../creds/serviceaccount.json")}"
  project     = "genial-broker-231710"
  region      = "australia-southeast1"
}
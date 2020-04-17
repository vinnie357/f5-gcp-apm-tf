# networks
# vpc
resource "google_compute_network" "vpc_network_mgmt" {
  name                    = "${var.projectPrefix}terraform-network-mgmt-${random_pet.buildSuffix.id}"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
}
resource "google_compute_subnetwork" "vpc_network_mgmt_sub" {
  name          = "${var.projectPrefix}mgmt-sub-${random_pet.buildSuffix.id}"
  ip_cidr_range = "10.0.10.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.vpc_network_mgmt.self_link}"

}
resource "google_compute_network" "vpc_network_int" {
  name                    = "${var.projectPrefix}terraform-network-int-${random_pet.buildSuffix.id}"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
}
resource "google_compute_subnetwork" "vpc_network_int_sub" {
  name          = "${var.projectPrefix}int-sub-${random_pet.buildSuffix.id}"
  ip_cidr_range = "10.0.20.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.vpc_network_int.self_link}"

}
resource "google_compute_network" "vpc_network_ext" {
  name                    = "${var.projectPrefix}terraform-network-ext-${random_pet.buildSuffix.id}"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
}
resource "google_compute_subnetwork" "vpc_network_ext_sub" {
  name          = "${var.projectPrefix}ext-sub-${random_pet.buildSuffix.id}"
  ip_cidr_range = "10.0.30.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.vpc_network_ext.self_link}"

}
# firewall
resource "google_compute_firewall" "default-allow-internal-mgmt" {
  name    = "${var.projectPrefix}default-allow-internal-mgmt-${random_pet.buildSuffix.id}"
  network = "${google_compute_network.vpc_network_mgmt.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  priority = "65534"

  source_ranges = ["10.0.10.0/24"]
}

resource "google_compute_firewall" "default-allow-internal-ext" {
  name    = "${var.projectPrefix}default-allow-internal-ext-${random_pet.buildSuffix.id}"
  network = "${google_compute_network.vpc_network_ext.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  priority = "65534"

  source_ranges = ["10.0.30.0/24"]
}

resource "google_compute_firewall" "default-allow-internal-int" {
  name    = "${var.projectPrefix}default-allow-internal-int-${random_pet.buildSuffix.id}"
  network = "${google_compute_network.vpc_network_int.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  priority = "65534"

  source_ranges = ["10.0.20.0/24"]
}
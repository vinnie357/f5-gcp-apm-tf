output "appAddress" {
    value = "https://${var.instance01Info.value.network_interface.0.access_config.0.nat_ip}"
}
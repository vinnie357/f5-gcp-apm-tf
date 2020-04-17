# BIG-IP Management Public IP Addresses
output "bigip_mgmt_ips" {
  value = module.bigip.device_mgmt_ips
}
# BIG-IP Password
output "password" {
  value     = random_password.password.result
  sensitive = false
}
# BIG-IP admin
output "adminUsername" {
  value     = var.adminAccountName
}
output "instance_name" {
    value = module.bigip.vm_instance.name
}
output "mgmt_ip" {
    value = module.bigip.vm_instance.network_interface.1.access_config.0.nat_ip
}
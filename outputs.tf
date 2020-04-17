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
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
# bigip1 mgmt public ip
output "mgmt_public_ip_01" {
    value = module.bigip.mgmt_public_ip_01
}
# bigip2 mgmt public ip
output "mgmt_public_ip_02" {
    value = module.bigip.mgmt_public_ip_02
}

output "instance01Info" {
    value = module.bigip.instance01Info
}

output "instance02Info" {
    value = module.bigip.instance02Info
}
variable host1_name { default = "apm01" }
variable dns_server { default = "8.8.8.8" }
variable ntp_server { default = "0.us.pool.ntp.org" }
variable timezone { default = "UTC" }

variable "bigipLicense1" {
  description = " bigip license for BYOL"
  default = ""
}
# from apm
variable adminUsername {}
variable bigip_mgmt_ips {}
variable password {}
variable mgmt_ip {}
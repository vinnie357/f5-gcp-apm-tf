variable host1_name { default = "apm01" }
variable dns_server { default = "8.8.8.8" }
variable ntp_server { default = "0.us.pool.ntp.org" }
variable timezone { default = "UTC" }

variable "bigipLicense1" {
  description = " bigip license for BYOL"
  default = ""
}
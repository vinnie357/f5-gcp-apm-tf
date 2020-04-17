provider "bigip" {
  address = "${var.url}"
  username = "${var.adminAccountName}"
  password = "${random_password.password.result}"
}

#Declarative Onboarding template 01
data "template_file" "vm01_do_json" {
  template = "${file("${var.bigipLicense1 != "" ? "standalone_byol" : "standalone"}.json")}"

  vars = {
    local_host      = "${var.host1_name}"
    dns_server	    = "${var.dns_server}"
    ntp_server	    = "${var.ntp_server}"
    timezone	    = "${var.timezone}"
    bigipLicense  = "${var.bigipLicense1}"
  }
}

resource "bigip_do"  "do-apm" {
     do_json = data.template_file.vm01_do_json.rendered
 }
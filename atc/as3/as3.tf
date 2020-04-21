provider "bigip" {
  address = "https://${var.mgmt_public_ip_01.value}"
  username = var.adminUsername.value
  password = var.password.value
}


#application services 3 template
data "template_file" "as3_json" {
  template = "${file("app.json")}"
  vars ={
      uuid = "${uuid()}"
      #virtualAddressExternal = "${var.instance01Info.value.network_interface.0.network_ip}"
      virtualAddressExternal = "${var.instance01Info.value.network_interface.0.access_config.0.nat_ip}"
      #sdCreds = "${base64encode(file("/creds/gcp/${var.GCP_SA_FILE}.json"))}"
  }
}
#application services 3 template
data "template_file" "as3_json_base" {
  template = "${file("base.json")}"
  vars ={
      uuid = "${uuid()}"
      virtualAddressExternal = "${var.instance01Info.value.network_interface.0.network_ip}"
      #virtualAddressExternal ="${google_compute_forwarding_rule.default.ip_address}"
      #sdCreds = "${base64encode(file("/creds/gcp/${var.GCP_SA_FILE}.json"))}"
  }
}

resource "bigip_as3"  "as3-apm" {
     as3_json = data.template_file.as3_json.rendered
     tenant_name = "DEV"
}

resource "bigip_as3"  "as3-base" {
     depends_on = [ bigip_as3.as3-apm ]
     as3_json = data.template_file.as3_json_base.rendered
     tenant_name = "GCP"
}
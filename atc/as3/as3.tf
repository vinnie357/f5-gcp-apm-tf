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
      virtualAddressExternal = ""
      #virtualAddressExternal ="${google_compute_forwarding_rule.default.ip_address}"
      #sdCreds = "${base64encode(file("/creds/gcp/${var.GCP_SA_FILE}.json"))}"
  }
}
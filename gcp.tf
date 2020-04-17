# provider
provider "google" {

project     = "${var.GCP_PROJECT_ID}"
region      = "${var.GCP_REGION}"
zone        = "${var.GCP_ZONE}"

}

# project
resource "random_pet" "buildSuffix" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    #ami_id = "${var.ami_id}"
    prefix = "${var.projectPrefix}"
  }
  #length = ""
  #prefix = "${var.projectPrefix}"
  separator = "-"
}
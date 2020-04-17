#!/bin/bash
git clone https://github.com/vinnie357/f5-gcp-apm-tf.git
cp admin.auto.tfvars.example f5-gcp-apm-tf/admin.auto.tfvars
cd f5-gcp-apm-tf
terraform init
terraform plan
#
terraform apply --auto-approve
echo "wait 6 minutes"
sleep 360
cd atc/do
terraform output -state=../../terraform.tfstate --json > apm.auto.tfvars.json
terraform init
terraform plan
#terraform destroy --auto-approve
#!/bin/bash
git clone https://github.com/vinnie357/f5-gcp-apm-tf.git
cp admin.auto.tfvars.example f5-gcp-apm-tf/admin.auto.tfvars
cd f5-gcp-apm-tf
terraform init
terraform plan
#
terraform apply --auto-approve
cd atc/do
terraform output -state=../../terraform.tfstate --json > apm.auto.tfvars.json
mgmtIp=$(cat apm.auto.tfvars.json | jq -r .instance01Info.value.network_interface[1].access_config[0].nat_ip)
echo "wait max 10 minutes"
checks=0
while [[ "$checks" -lt 10 ]]; do
    echo "waiting on: https://$mgmtIp" 
    curl -sk --retry 10 --retry-connrefused --retry-delay 30 https://$mgmtIp
if [ $? == 0 ]; then
    echo "mgmt ready"
    break
fi
echo "mgmt not ready yet"
let checks=checks+1
sleep 60
done
terraform init
terraform plan
terraform apply --auto-approve
sleep 10
# run again because of DO DHCLIENT bug
terraform apply --auto-approve
echo "wait 3 minutes"
sleep 180
cp apm.auto.tfvars.json ../as3/apm.auto.tfvars.json
cd ../as3
terraform init
terraform plan
terraform apply --auto-approve
#terraform destroy --auto-approve
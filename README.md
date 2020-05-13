# f5-gcp-apm-tf
deploy f5 apm in gcp with terraform



# New VPC with 3-nic BIG-IP

**Note:** This example creates a random, temporary password for the BIG-IP which is stored in the Terraform state file.  This is not a good practice for production environments.  Ideally, you would use a random password generated by the Secrets Manager API.

## Usage
To run this example run the following commands:
```bash
terraform init
terraform plan
terraform apply --auto-approve 
```

**Note:** this examples deploys resources that will cost money.  Please run the following command to destroy your environment when finished:
```bash
terraform destroy --auto-approve
```

### optional variables for Terraform Cloud

**no new line characters!! in env vars**
https://github.com/hashicorp/terraform/issues/22796

GOOGLE_CREDENTIALS="mycredsjson"

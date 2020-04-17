## Deployment Steps
### Obtain state from 0-apm
```bash
terraform output -state=../../terraform.tfstate --json > apm.auto.tfvars.json
```
### Initialize Terraform
```bash
terraform init
```
### Validate and Apply
```bash
terraform validate && terraform apply
```
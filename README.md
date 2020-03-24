# terraform-aws

This project contains set of terraform scripts to scaffold AWS infrastructure.  

## Getting started

### Dependencies:
- terraform
- aws-cli

### Scaffolding AWS resources:
1. Edit [main.tf](./main.tf) and change the values to your bucket where you would be holding terraform state:

```sh
  bucket = "mariocoski-terraform-state"
  key    = "dev/terraform.tfstate"
```

2. Edit [terraform.tfvars](./terraform.tfvars) and adjust the vars to match your needs.

3. If you haven't already configure your awscli and provider access key and secret:

```sh
aws configure
```

4. Check what is going to be created by running:

```sh
terraform plan
```

5. To create resources run:

```sh
terraform apply
```

6. To destroy terraform managed infrastructure run:

```sh
terraform destroy
```

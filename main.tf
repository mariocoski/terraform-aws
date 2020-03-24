terraform {
  backend "s3" {
    bucket  = "mariocoski-terraform-state"
    key     = "dev/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}

provider "aws" {
  region = "${var.aws_region}"
}
module "networking" {
  source                                  = "./networking"
  vpc_cidr                                = "${var.vpc_cidr}"
  aws_region                              = "${var.aws_region}"
  public_subnet_a_cidr                    = "${var.public_subnet_a_cidr}"
  private_subnet_a_cidr                   = "${var.private_subnet_a_cidr}"
  public_subnet_b_cidr                    = "${var.public_subnet_b_cidr}"
  private_subnet_b_cidr                   = "${var.private_subnet_b_cidr}"
  public_security_group_ingress_ssh_cidr  = "${var.public_security_group_ingress_ssh_cidr}"
  public_security_group_ingress_http_cidr = "${var.public_security_group_ingress_http_cidr}"
}

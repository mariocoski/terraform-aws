# public subnets
output "public_subnet_a_id" {
  value = "${module.networking.public_subnet_a_id}"
}

output "public_subnet_a_cidr" {
  value = "${module.networking.public_subnet_a_cidr}"
}

output "public_subnet_b_id" {
  value = "${module.networking.public_subnet_b_id}"
}

output "public_subnet_b_cidr" {
  value = "${module.networking.public_subnet_b_cidr}"
}

# private subnets
output "private_subnet_a_id" {
  value = "${module.networking.private_subnet_a_id}"
}
output "private_subnet_a_cidr" {
  value = "${module.networking.private_subnet_a_cidr}"
}
output "private_subnet_b_id" {
  value = "${module.networking.private_subnet_b_id}"
}
output "private_subnet_b_cidr" {
  value = "${module.networking.private_subnet_b_cidr}"
}

# public security group
output "tf_public_sg_id" {
  value = "${module.networking.tf_public_sg}"
}
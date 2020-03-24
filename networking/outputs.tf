output "public_subnet_a_id" {
  value = "${aws_subnet.tf_public_subnet_a.id}"
}
output "public_subnet_a_cidr" {
  value = "${aws_subnet.tf_public_subnet_a.cidr_block}"
}

output "private_subnet_a_id" {
  value = "${aws_subnet.tf_private_subnet_a.id}"
}

output "private_subnet_a_cidr" {
  value = "${aws_subnet.tf_private_subnet_a.cidr_block}"
}

output "public_subnet_b_id" {
  value = "${aws_subnet.tf_public_subnet_b.id}"
}

output "public_subnet_b_cidr" {
  value = "${aws_subnet.tf_public_subnet_b.cidr_block}"
}
output "private_subnet_b_id" {
  value = "${aws_subnet.tf_private_subnet_b.id}"
}
output "private_subnet_b_cidr" {
  value = "${aws_subnet.tf_private_subnet_b.cidr_block}"
}
output "tf_public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}
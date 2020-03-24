resource "aws_vpc" "tf_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  tags = {
    Name = "tf-igw"
  }
}

resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_internet_gateway.id}"
  }

  tags = {
    Name = "tf-rt-public"
  }
}

resource "aws_default_route_table" "tf_private_rt" {
  default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"

  tags = {
    Name = "tf-rt-private"
  }
}

resource "aws_subnet" "tf_public_subnet_a" {
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.public_subnet_a_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "tf-public-subnet-a"
  }
}

resource "aws_subnet" "tf_private_subnet_a" {
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.private_subnet_a_cidr}"
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "tf-private-subnet-a"
  }
}

resource "aws_subnet" "tf_public_subnet_b" {
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.public_subnet_b_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}b"

  tags = {
    Name = "tf-public-subnet-b"
  }
}

resource "aws_subnet" "tf_private_subnet_b" {
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.private_subnet_b_cidr}"
  availability_zone       = "${var.aws_region}b"

  tags = {
    Name = "tf-private-subnet-b"
  }
}
resource "aws_route_table_association" "tf_public_a_association" {
  subnet_id      = "${aws_subnet.tf_public_subnet_a.id}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}

resource "aws_route_table_association" "tf_public_b_association" {
  subnet_id      = "${aws_subnet.tf_public_subnet_b.id}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}
resource "aws_security_group" "tf_public_sg" {
  name        = "tf_public_sg"
  description = "Used for access to the public instances"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.public_security_group_ingress_ssh_cidr}"]
  }

  # http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.public_security_group_ingress_http_cidr}"]
  }

  # https
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.public_security_group_ingress_http_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-security-group"
  }
}
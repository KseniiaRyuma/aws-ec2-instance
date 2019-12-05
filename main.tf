terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "${var.aws_region}b"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]

  tags = {
    Name       = var.name
    Owner      = var.owner
    DeployedBy = "Terraform"
    TTL        = "7days"
  }
}

resource "aws_security_group" "bastion" {
  name = "${var.name}-bastion"
  tags = {
    Name = "SSH"
  }
}
resource "aws_security_group_rule" "allow_ssh_in" {
  type = "ingress"
  security_group_id = aws_security_group.bastion.id
  from_port   = 0
  to_port     = 0
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}
resource "aws_security_group_rule" "allow_all_out" {
  type = "egress"
  security_group_id = aws_security_group.bastion.id
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}


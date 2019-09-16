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

  tags = {
    Name       = var.name
    Owner      = var.owner
    DeployedBy = "Terraform"
    TTL        = "24h"
  }
}

resource "aws_security_group" "bastion" {
  name = "phan-bastion"
  tags = {
    Name = "SSH"
  }
}
resource "aws_security_group_rule" "allow_ssh_in" {
  type = "ingress"
  security_group_id = "aws_security_group.bastion.id"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
      ]
  }
}
resource "aws_security_group_rule" "allow_all_out" {
  type = "egress"
  security_group_id = "aws_security_group.bastion.id"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
      ]
  }
}


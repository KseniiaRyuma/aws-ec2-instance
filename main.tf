terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
<<<<<<< HEAD
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = var.name
    Owner = var.owner
    DeployedBy = "Terraform"
=======
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.name}"
>>>>>>> bb48c4c803aa0ba650ee6638fa58d7476be75256
  }
}

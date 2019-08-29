variable "aws_region" {
  description = "AWS region"
  default = "us-west-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-056d04da775d124d7"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t3.micro"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "Phan-Provisioned by Terraform"
}

variable "owner" {
  default = "Peter Phan"
}

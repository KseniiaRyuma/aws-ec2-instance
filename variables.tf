variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2" # us-west-1 will fail. us-west-2 will pass.
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  #default = "ami-2e1ef954"
  #default = "ami-056d04da775d124d7" #us-west-1
  default = "ami-09a3d8a7177216dcf" #us-west-2
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default     = "t3.large"
}

variable "name" {
  description = "name to pass to Name tag"
  default     = "pphan"
}

variable "owner" {
  default = "Peter Phan"
}

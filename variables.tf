# Variables for Customization
variable "region" {
  default = "us-east-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0fae88c1e6794aa17"  # Amazon Linux 2023 AMI ID
}

variable "key_name" {
  default = "GC"
}
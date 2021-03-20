variable "ami" {
  description = "AMI Instance ID"
  default = "ami-00f9f4069d04c0c6e"
}

variable "instance_type" {
  description = "Type of instance"
  default = "t2.micro"
}

variable "key_name" {
  description = "key name for the instance"
  default = "aws-ofc"
}


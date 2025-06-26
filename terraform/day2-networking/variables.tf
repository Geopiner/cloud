variable "aws_region" {
  default     = "eu-west-2"
}

variable "aws_profile" {
  default     = "default"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default     = "10.0.2.0/24"
}

variable "availability_zones" {
  default     = "eu-west-2a"
}

variable "key_name" {
  default     = "George-key"
}

variable "ami_id" {
  default     = "ami-0b9dd1f70861d4721"
}

variable "instance_type" {
  default     = "t3.micro"
}

variable "my_ip_cidr" {
  description = "Your IP address with /32 suffix"
  type        = string
  default     = "86.16.12.21/32"
}


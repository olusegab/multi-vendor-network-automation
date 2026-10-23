variable "aws_region" {
  type    = string
  default = "us-east-1"   # change to your region
}

variable "project_name" {
  type    = string
  default = "hq-hub"
}

variable "vpc_cidr" {
  type    = string
  default = "10.50.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.50.1.0/24"
}
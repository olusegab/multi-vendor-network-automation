variable "aws_region" {
  type    = string
  default = "us-east-1" # change to your region
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

variable "sophos_public_ip" {
  type        = string
  description = "Public IP of the HQ Sophos firewall"
}

variable "onprem_cidrs" {
  type        = list(string)
  description = "Networks reachable through the VPN (HQ now, stores later)"
  default     = ["192.168.0.0/24", "172.16.0.0/16"]
}
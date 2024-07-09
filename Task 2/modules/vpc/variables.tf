variable "project_id" {
    type = string
    description = "Project ID"
}

variable "region" {
    type = string
    description = "region"
}

variable "vpc_name" {
    type = string
    description = "vpc network name"
}

variable "public_subnet_cidr_range" {
  description = "cidr_range for public-subnet"
}

variable "private_subnet_cidr_range" {
  description = "cidr_range for private-subnet"
}

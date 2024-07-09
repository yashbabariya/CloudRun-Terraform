terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.36.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a VPC Network
resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-vpc"
  auto_create_subnetworks = false
  mtu = 1460
  routing_mode = "REGIONAL"
  description = "This is a VPC network"
}

# Create a Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name = "public-subnet"
  ip_cidr_range = var.public_subnet_cidr_range
  network = google_compute_network.vpc_network.self_link
  region = var.region
  private_ip_google_access = true
  depends_on = [ google_compute_network.vpc_network ]
}

# Create a Private Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name = "private-subnet"
  ip_cidr_range = var.private_subnet_cidr_range
  network = google_compute_network.vpc_network.self_link
  region = var.region
  
  private_ip_google_access = false
  depends_on = [ google_compute_network.vpc_network ]
}
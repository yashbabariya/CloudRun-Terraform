terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.36.0"
    }
  }
}

provider "google" {
  region = "asia-south1"
}

module "vpc" {
  source                    = "./modules/vpc"
  region                    = "<region-name>"
  project_id                = "<project-id>"
  vpc_name                  = "<vpc-name>"
  public_subnet_cidr_range  = "<cidr-range>"
  private_subnet_cidr_range = "<cidr-range>"
}

module "cloudrun" {
  source                    = "./modules/cloudrun"
  region                    = "<region-name>"
  project_id                = "<project-id>"
  docker_image              = "<image-name>"
  cloudrun_name             = "<cloudrun-name>"
  cloudrun_resources_cpu    = "<cpu>"
  cloudrun_resources_memory = "<memory>"
}
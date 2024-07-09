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
  region                    = "asia-south1"
  project_id                = "task-terraform-428814"
  vpc_name                  = "demo"
  public_subnet_cidr_range  = "10.0.1.0/24"
  private_subnet_cidr_range = "10.0.2.0/24"
}

module "cloudrun" {
  source                    = "./modules/cloudrun"
  region                    = "asia-south1"
  project_id                = "task-terraform-428814"
  docker_image              = "asia-south1-docker.pkg.dev/task-terraform-428814/simple-app/myreactapp:v1"
  cloudrun_name             = "reactapp-demo"
  cloudrun_resources_cpu    = "0.5"
  cloudrun_resources_memory = "200Mi"
}
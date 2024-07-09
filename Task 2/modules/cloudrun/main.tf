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

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}

# main.tf

# Create the Cloud Run service
resource "google_cloud_run_service" "run_service" {
  name     = var.cloudrun_name
  location = var.region

  template {
    spec {
      containers {
        image = var.docker_image

        resources {
          limits = {
            cpu = var.cloudrun_resources_cpu
            memory = var.cloudrun_resources_memory
          }
        }
      }
      
    }
  }
  

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.run_service.name
  location = google_cloud_run_service.run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}


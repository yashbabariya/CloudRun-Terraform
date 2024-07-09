resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}

# main.tf

# Create the Cloud Run service
resource "google_cloud_run_service" "run_service" {
  name     = "react-app"
  location = "asia-south1"

  template {
    spec {
      containers {
        image = "asia-south1-docker.pkg.dev/task-terraform-428814/simple-app/myreactapp:v1"
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

# Display the service URL
output "service_url" {
  value = google_cloud_run_service.run_service.status[0].url
}
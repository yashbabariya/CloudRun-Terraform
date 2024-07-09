# Display the service URL
output "service_url" {
  description = "URL of the Cloud Run service"
  value = google_cloud_run_service.run_service.status[0].url
}
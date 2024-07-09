# Display the service URL
output "service_url" {
  description = "URL of the Cloud Run service"
  value = module.cloudrun.service_url
}
variable "project_id" {
    type = string
    description = "Project ID"
}

variable "region" {
    type = string
    description = "region"
}

variable "cloudrun_name" {
    type = string
    description = "cloudrun Name"
}

variable "docker_image" {
    type = string
    description = "gcr docker image name"
}

variable "cloudrun_resources_cpu" {
    description = "cloudrun resource limit cpu values"
}

variable "cloudrun_resources_memory" {
  description = "cloudrun resource limit memory values"
}
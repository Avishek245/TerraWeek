# --- Primitive types ---
variable "container_name" {
  description = "Name of the Docker container."
  type        = string
  default     = "terraweek-web"
}

variable "external_port" {
  description = "Host port to expose the container on."
  type        = number
  default     = 8080

  validation {
    condition     = var.external_port > 1024 && var.external_port < 65535
    error_message = "external_port must be between 1025 and 65534."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

# --- Collection type ---
variable "image_tag" {
  description = "Nginx image tag to pull."
  type        = string
  default     = "1.27-alpine"
}

variable "extra_labels" {
  description = "Additional labels to attach to the container."
  type        = map(string)
  default = {
    team = "trainwithshubham"
  }
}

variable "docker_password" {
  description = "Example sensitive variable"
  type        = string
  sensitive   = true
  default     = "change-me"
}

variable "container_config" {
  description = "Bonus optional object"
  type = object({
    name = string
    port = optional(number, 8080)
  })
  default = {
    name = "nginx"
  }
}

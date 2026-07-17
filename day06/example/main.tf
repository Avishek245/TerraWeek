
variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "app_name" {
  description = "AI Bank app"
  type        = string
  default     = "terraweek"
}

locals {
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
  name_prefix   = "${var.app_name}-${var.environment}"
}

resource "random_pet" "id" {
  prefix = local.name_prefix
  length = 2
}

output "resource_name" {
  value = random_pet.id.id
}

output "instance_type" {
  value = local.instance_type
}

variable "name" {
  description = "Short logical server name"
  type        = string
  nullable    = false

  validation {
    condition = can(regex(
      "^[a-z0-9]([a-z0-9-]{0,38}[a-z0-9])?$",
      var.name
    ))
    error_message = "Name must contain 1-40 lowercase alphanumeric characters or hyphens, starting and ending with an alphanumeric character."
  }
}

variable "environment" {
  description = "Target infrastructure environment"
  type        = string
  nullable    = false

  validation {
    condition = contains([
      "production",
      "nonproduction"
    ], var.environment)
    error_message = "Environment must be production or nonproduction."
  }
}

variable "hosting_provider" {
  description = "Infrastructure hosting provider"
  type        = string
  nullable    = false

  validation {
    condition = contains([
      "ionos",
      "hostinger"
    ], var.hosting_provider)
    error_message = "Hosting provider must be ionos or hostinger."
  }
}

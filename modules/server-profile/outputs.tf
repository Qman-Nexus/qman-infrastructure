output "hostname" {
  description = "Standardized infrastructure hostname"
  value       = local.hostname
}

output "profile" {
  description = "Standardized server profile"
  value       = local.profile
}

output "labels" {
  description = "Standard infrastructure metadata"
  value       = local.labels
}

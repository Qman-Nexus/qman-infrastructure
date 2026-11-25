terraform {
  required_version = ">= 1.10.0, < 2.0.0"
}

module "production" {
  source = "../../modules/server-profile"

  name             = "demo-01"
  environment      = "production"
  hosting_provider = "ionos"
}

module "nonproduction" {
  source = "../../modules/server-profile"

  name             = "demo-02"
  environment      = "nonproduction"
  hosting_provider = "hostinger"
}

output "production_profile" {
  description = "Example production server profile"
  value       = module.production.profile
}

output "nonproduction_profile" {
  description = "Example non-production server profile"
  value       = module.nonproduction.profile
}

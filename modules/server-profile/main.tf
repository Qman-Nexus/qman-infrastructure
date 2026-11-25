locals {
  project = "qman"

  hostname = join("-", [
    local.project,
    var.environment,
    var.name
  ])

  profile = {
    project          = local.project
    name             = var.name
    hostname         = local.hostname
    environment      = var.environment
    hosting_provider = var.hosting_provider
  }

  labels = {
    project     = local.project
    environment = var.environment
    provider    = var.hosting_provider
  }
}

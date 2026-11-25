variables {
  name             = "demo-01"
  environment      = "production"
  hosting_provider = "ionos"
}

run "production_profile" {
  command = plan

  assert {
    condition     = output.hostname == "qman-production-demo-01"
    error_message = "Production hostname is incorrect."
  }

  assert {
    condition     = output.profile.environment == "production"
    error_message = "Production environment is incorrect."
  }
}

run "nonproduction_profile" {
  command = plan

  variables {
    name             = "demo-02"
    environment      = "nonproduction"
    hosting_provider = "hostinger"
  }

  assert {
    condition     = output.hostname == "qman-nonproduction-demo-02"
    error_message = "Non-production hostname is incorrect."
  }

  assert {
    condition     = output.profile.hosting_provider == "hostinger"
    error_message = "Hosting provider is incorrect."
  }
}

run "reject_invalid_environment" {
  command = plan

  variables {
    environment = "unknown"
  }

  expect_failures = [var.environment]
}

run "reject_invalid_hostname" {
  command = plan

  variables {
    name = "INVALID_SERVER"
  }

  expect_failures = [var.name]
}

run "reject_invalid_provider" {
  command = plan

  variables {
    hosting_provider = "unknown"
  }

  expect_failures = [var.hosting_provider]
}

# Server Profile Module

## Purpose

Provides standardized server naming, environment
validation and infrastructure metadata for the
Qman Enterprise Platform.

## Features

- Consistent naming conventions
- Environment validation
- Hosting provider validation
- Standardized infrastructure metadata
- Provider-independent implementation

## Inputs

| Name | Type | Required |
|------|------|----------|
| name | string | Yes |
| environment | string | Yes |
| hosting_provider | string | Yes |

## Outputs

- hostname
- profile
- labels

## Supported Environments

- production
- nonproduction

## Supported Hosting Providers

- ionos
- hostinger

## Security

This module does not require credentials,
create cloud resources or modify existing
infrastructure.

## Testing

Run the following commands from the module directory:

    terraform init
    terraform validate
    terraform test

## Status

Initial reference implementation.

# IAC-003 — Infrastructure Provider Assessment

## Metadata

- Project: Qman Enterprise Platform
- Phase: 3 — Infrastructure as Code
- Control: IAC-003
- Date: 2026-11-25
- Version: 1.0
- Classification: Public
- Status: PASS

## 1. Objective

Evaluate the capabilities of the existing infrastructure
providers before bringing resources under Terraform
management.

The assessment focuses on:

- Infrastructure provisioning
- API availability
- Terraform provider support
- Existing resource import
- Infrastructure lifecycle management
- Security and operational risks
- Cost efficiency
- Provider independence

## 2. Infrastructure Overview

| Environment | Provider | Infrastructure |
|-------------|----------|----------------|
| Production | IONOS | Standard Linux VPS |
| Non-production | Hostinger | Linux VPS |

The existing infrastructure will be retained.

No additional virtual servers or subscription upgrades
are required for the current implementation.

## 3. Hostinger Assessment

### Provider Information

- Environment: Non-production
- Terraform provider: hostinger/hostinger
- Evaluated provider version: 0.1.23
- API availability: Supported
- Existing resource import: Supported
- Infrastructure lifecycle management: Supported

### Verification Results

| Verification | Result |
|--------------|--------|
| API authentication | PASS |
| Read-only API request | PASS |
| Terraform provider initialization | PASS |
| Terraform configuration validation | PASS |
| Terraform data source evaluation | PASS |
| Read-only Terraform plan | PASS |

The Hostinger API and Terraform provider have been
successfully tested using read-only operations.

No existing infrastructure resources were created,
modified, reinstalled or deleted during the assessment.

### Management Strategy

Hostinger is selected as the initial provider for
Terraform-based infrastructure management.

Existing infrastructure will be imported only after
secure remote state management has been implemented
and verified.

Provider firewall management and other infrastructure
capabilities will be evaluated separately before
implementation.

### Security Considerations

The Hostinger API token must be treated as a
privileged infrastructure credential.

A dedicated read-only token scope has not been
confirmed.

The following controls are required:

- Store API credentials outside Git repositories.
- Restrict local credential file permissions.
- Use dedicated credentials where supported.
- Avoid exposing credentials in workflow logs.
- Review all Terraform plans before execution.
- Require explicit authorization for destructive changes.
- Protect existing VPS resources against accidental
  destruction.
- Evaluate Terraform lifecycle protection using
  prevent_destroy.
- Verify provider-specific lifecycle behavior.

Particular attention must be given to operations
that may trigger operating system reinstallation,
resource replacement or subscription cancellation.

### Assessment Status

PASS — Approved for subsequent Terraform integration,
subject to secure state management and lifecycle
safety verification.

## 4. IONOS Assessment

### Provider Information

- Environment: Production
- Subscription type: Standard Linux VPS
- IONOS Cloud Terraform provider: Not applicable
  to the existing subscription
- Infrastructure provisioning: Manual
- Operating system configuration: Ansible
- Application deployment: GitHub Actions
- Private network access: Tailscale

### Assessment Results

The existing IONOS subscription is a standard VPS
subscription rather than an IONOS Cloud Compute
Engine environment.

The IONOS Cloud Terraform provider is therefore not
applicable to the existing production VPS.

Migrating to another infrastructure product solely
to enable Terraform provisioning would introduce
unnecessary costs and operational complexity.

### Accepted Architecture Exception

Manual infrastructure provisioning is accepted
for the existing IONOS production environment.

This exception applies to provider-level
infrastructure provisioning only.

The following components remain candidates
for automated management:

- Operating system configuration
- User and access management
- SSH hardening
- Host firewall configuration
- Package installation
- Security updates
- Application deployment
- Monitoring
- Logging
- Backup and recovery

Manual provider-level operations must be documented
and reproducible where possible.

### Assessment Status

PASS — Manual infrastructure provisioning accepted.

## 5. Provider Capability Matrix

| Capability | Hostinger | IONOS Standard VPS |
|------------|-----------|--------------------|
| Terraform provisioning | Supported | Not applicable |
| Existing resource import | Supported | Not applicable |
| Infrastructure lifecycle management | Supported | Manual |
| Provider firewall management | Under evaluation | Manual |
| Operating system configuration | Ansible | Ansible |
| Security hardening | Ansible | Ansible |
| Application deployment | GitHub Actions | GitHub Actions |
| Private network access | Tailscale | Tailscale |
| Monitoring automation | Planned | Planned |
| Backup automation | Planned | Planned |

## 6. Target Infrastructure Architecture

The platform follows a hybrid infrastructure
management approach.

Terraform is used for provider-level infrastructure
management where suitable APIs and providers
are available.

Ansible will provide a consistent operating system
configuration and security baseline across both
infrastructure providers.

GitHub Actions will provide automated validation,
testing and controlled deployment workflows.

Tailscale provides private network connectivity
and restricted administrative access.

### Responsibility Model

| Component | Responsibility |
|-----------|----------------|
| Terraform | Infrastructure provisioning and lifecycle management |
| Ansible | Operating system and service configuration |
| GitHub | Version-controlled source of truth |
| GitHub Actions | Automated validation and deployment |
| Tailscale | Private connectivity and workload identity |
| Restic | Backup and recovery |
| Backblaze B2 | Encrypted backup storage |

Provider-specific limitations must not prevent
the implementation of a consistent platform
configuration standard.

## 7. Secure Terraform State Management

Terraform state must be protected against:

- Unauthorized access
- Accidental disclosure
- Concurrent modifications
- Data loss
- State corruption

Production and non-production infrastructure
must use separate state boundaries.

HCP Terraform Free has been selected as the
preferred candidate for remote state management,
pending successful onboarding and verification.

Organization creation is currently blocked.

The following capabilities must be verified
before managing existing infrastructure:

- Remote state storage
- Encryption
- Access control
- State locking
- State version history
- State recovery

### Current Status

IAC-004 — BLOCKED

Until secure state management has been verified,
existing VPS resources must not be imported into
Terraform management.

Infrastructure module development and CI validation
may continue using local, provider-independent
reference implementations.

## 8. Security Requirements

The following security requirements apply to all
infrastructure providers:

- Least privilege access
- Multi-factor authentication where supported
- Secure credential storage
- Explicit environment separation
- Version-controlled infrastructure definitions
- Mandatory infrastructure change review
- Secure Terraform state management
- Protected deployment workflows
- Automated configuration validation
- Documented recovery procedures
- Explicit authorization for destructive operations

Confidential infrastructure information must not
be stored in this public repository.

This includes:

- API tokens
- Private SSH keys
- Passwords
- Terraform state files
- Sensitive Terraform plan files
- Internal infrastructure inventories
- Provider-specific resource identifiers
- Customer information

## 9. Scope Boundaries

The following infrastructure is outside the scope
of this assessment:

- Talland infrastructure
- Unrelated personal infrastructure
- Customer systems not explicitly authorized
  for Terraform management

No changes will be made to systems outside
the approved Qman Enterprise Platform scope.

## 10. Architecture Decisions

| Decision | Outcome |
|----------|---------|
| Retain existing VPS providers | Accepted |
| Use Terraform for Hostinger infrastructure | Accepted |
| Retain manual IONOS provisioning | Accepted exception |
| Standardize configuration through Ansible | Accepted |
| Separate production and non-production state | Required |
| Avoid unnecessary provider upgrades | Accepted |
| Avoid additional paid infrastructure services | Current design objective |
| Require secure state before infrastructure import | Mandatory |

## 11. Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| Accidental VPS destruction | Lifecycle protection and explicit approval |
| Privileged provider API credentials | Secure storage and restricted usage |
| Terraform state disclosure | Private and encrypted state storage |
| Concurrent infrastructure changes | Verified state locking |
| Manual IONOS provisioning drift | Documented procedures and periodic verification |
| Provider-specific limitations | Provider-independent configuration standards |
| Remote state service unavailability | Block infrastructure import until resolved |

## 12. Cost Management

The existing infrastructure subscriptions will
be retained.

No additional VPS instances were provisioned
during this assessment.

No paid infrastructure subscription upgrades
were introduced.

Cost efficiency remains an important design
principle, alongside security, reliability
and operational simplicity.

## 13. References

### Hostinger

- https://developers.hostinger.com/
- https://registry.terraform.io/providers/hostinger/hostinger/latest/docs
- https://github.com/hostinger/terraform-provider-hostinger

### IONOS

- https://cloud.ionos.com/
- https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs

### Terraform

- https://developer.hashicorp.com/terraform
- https://developer.hashicorp.com/terraform/language/state
- https://developer.hashicorp.com/terraform/language/modules

### Qman Enterprise Platform

- https://github.com/Qman-Nexus/qman-platform

## 14. Conclusion

The existing infrastructure providers have been
successfully assessed.

Hostinger supports Terraform-based infrastructure
management and has been validated through
read-only API and Terraform operations.

The existing IONOS production VPS will retain
manual provider-level provisioning as an accepted
architecture exception.

Both environments will use a standardized approach
to configuration management, security hardening,
application deployment, monitoring and recovery.

This hybrid infrastructure management approach
preserves provider independence, avoids unnecessary
costs and supports the engineering objectives
of the Qman Enterprise Platform.

## 15. Final Status

IAC-003 — PASS

Provider assessment completed.

Infrastructure integration remains dependent
on the successful completion of IAC-004
Secure Terraform State Management.

---

Qman Enterprise Platform

Secure by design. Automated by default.

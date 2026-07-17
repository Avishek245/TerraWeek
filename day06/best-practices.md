# 🚀 Terraform Best Practices Checklist

## ✅ 1. Remote State Management
- Terraform state should never be committed to Git.
- Use a remote backend such as AWS S3.
- Enable state locking using an S3 lockfile (or DynamoDB for older setups) to prevent concurrent modifications.

---

## ✅ 2. Version Pinning
Always pin versions to ensure reproducible deployments.

### Terraform Version

```hcl
terraform {
  required_version = ">= 1.13.0"
}
```

### Provider Version

```hcl
required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 6.0"
  }
}
```

### Module Version

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
}
```

---

## ✅ 3. Use Reusable Modules

Create reusable modules instead of duplicating Terraform code.

Example:

```
modules/
└── ec2_instance/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
```

Benefits:
- Reusability
- Maintainability
- Consistency

---

## ✅ 4. No Hardcoded Secrets

Never store:

- AWS Access Keys
- Secret Keys
- Passwords

Instead use:

- Variables
- Environment Variables
- AWS Secrets Manager
- AWS IAM Roles

---

## ✅ 5. Quality Checks

Run before every deployment:

```bash
terraform fmt -recursive
terraform validate
terraform test
```

Security Scan:

```bash
trivy config .
```

---

## ✅ 6. CI/CD

Use GitHub Actions to automatically run:

- Terraform Init
- Terraform Format Check
- Terraform Validate
- Terraform Test

---

## ✅ 7. Documentation

Every Terraform project should contain:

- README.md
- Architecture Diagram
- Deployment Steps
- Variables
- Outputs
- Destroy Instructions

---

## ✅ 8. Cleanup

Destroy infrastructure after testing.

```bash
terraform destroy
```

This prevents unnecessary AWS charges.

---

# Summary

Following Terraform best practices improves:

- Security
- Scalability
- Reusability
- Collaboration
- Maintainability
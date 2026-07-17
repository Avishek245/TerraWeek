# 🚀 TerraWeek Day 6 – Advanced Terraform + Capstone Project

**Date:** Friday, 17th July 2026

## 🎯 Objective

The goal of Day 6 was to explore advanced Terraform concepts such as Workspaces, Testing, Security Scanning, CI/CD integration, and Terraform best practices. This day also focused on preparing production-ready Infrastructure as Code (IaC) workflows.

---

# ✅ Task 1 – Terraform Workspaces

## What are Terraform Workspaces?

Terraform Workspaces allow multiple environments (such as development, staging, and production) to use the same Terraform configuration while maintaining separate state files.

### Commands Used

```bash
terraform workspace list
terraform workspace new staging
terraform workspace new prod
terraform workspace select staging
terraform workspace select prod
terraform workspace show
```

### Local Configuration

```hcl
locals {
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
  name_prefix   = "${var.app_name}-${var.environment}"
}
```

### What I Learned

- Created multiple Terraform workspaces.
- Switched between workspaces.
- Understood how workspaces isolate Terraform state.
- Learned how environments can use different configurations.

---

# ✅ Task 2 – Terraform Quality Gates

## Format Terraform Code

```bash
terraform fmt -recursive
```

## Validate Configuration

```bash
terraform validate
```

Output:

```
Success! The configuration is valid.
```

## Run Native Terraform Tests

```bash
terraform test
```

Output:

```
Success! 4 passed, 0 failed.
```

### Test Cases Executed

- ✔ Development environment uses t3.micro
- ✔ Production environment uses t3.medium
- ✔ Resource name uses the correct prefix
- ✔ Invalid environment values are rejected

### Plan vs Apply Tests

| Plan Test | Apply Test |
|------------|------------|
| Checks execution plan only | Creates real infrastructure |
| Faster | Slower |
| No cloud resources created | Resources are created and destroyed |
| Good for CI | Good for integration testing |

---

# ✅ Task 3 – Security Scanning

Installed Trivy and scanned the Terraform configuration.

```bash
trivy --version
```

```bash
trivy config .
```

### Purpose

- Detect security misconfigurations.
- Identify insecure Terraform resources.
- Improve Infrastructure as Code security before deployment.

---

# ✅ Task 4 – GitHub Actions CI/CD

Created a GitHub Actions workflow to automate Terraform validation.

### Workflow File

```
.github/workflows/terraform.yml
```

### Pipeline Steps

- Checkout Repository
- Setup Terraform
- Terraform Init
- Terraform Format Check
- Terraform Validate
- Terraform Test

The workflow was pushed to GitHub and executed successfully.

---

# ✅ Task 5 – Terraform Best Practices

Implemented the following best practices:

- Remote state management using AWS S3.
- State locking to prevent concurrent updates.
- Provider and module version pinning.
- Reusable Terraform modules.
- No hardcoded secrets.
- Terraform formatting and validation.
- Native Terraform testing.
- Security scanning using Trivy.
- GitHub Actions for CI/CD.
- Clear documentation and cleanup using `terraform destroy`.

---

# 📂 Project Structure

```
day06/
│
├── example/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── tests/
│       └── basic.tftest.hcl
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
└── day06.md
```

---

# 💡 Key Learnings

- Terraform Workspaces simplify multi-environment deployments.
- Native Terraform testing improves configuration reliability.
- Security scanning helps identify Infrastructure as Code risks.
- GitHub Actions automates Terraform quality checks.
- Following Terraform best practices makes infrastructure secure, reusable, and production-ready.

---

# 🛠 Tools Used

- Terraform
- AWS
- GitHub
- GitHub Actions
- Trivy
- Visual Studio Code

---

# 📸 Evidence
![alt text](<Screenshot (662).png>) ![alt text](<Screenshot (643).png>) ![alt text](<Screenshot (644).png>) ![alt text](<Screenshot (645).png>) ![alt text](<Screenshot (646).png>) ![alt text](<Screenshot (647).png>) ![alt text](<Screenshot (648).png>) ![alt text](<Screenshot (649).png>) ![alt text](<Screenshot (650).png>) ![alt text](<Screenshot (651).png>) ![alt text](<Screenshot (652).png>) ![alt text](<Screenshot (653).png>) ![alt text](<Screenshot (654).png>) ![alt text](<Screenshot (655).png>) ![alt text](<Screenshot (656).png>) ![alt text](<Screenshot (657).png>)

---

# 🎯 Outcome

Successfully completed TerraWeek Day 6 by implementing advanced Terraform concepts, automated testing, security scanning, GitHub Actions CI/CD, and Infrastructure as Code best practices. This project demonstrates a production-oriented Terraform workflow suitable for real-world DevOps environments.

### 🏷️ Tags

**#Terraform #InfrastructureAsCode #AWS #DevOps #CloudComputing #TerraformModules #TrainWithShubham #TerraWeekChallenge**
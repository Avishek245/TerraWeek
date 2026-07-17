# 📦 TerraWeek Day 5 — Terraform Modules: Reusable, Composable Infrastructure

> Part of the **#TerraWeek Challenge by #TrainWithShubham**

## 📖 Overview

Today I learned one of the most important concepts in Terraform: **Modules**.

Terraform modules help organize infrastructure into reusable building blocks, making Infrastructure as Code (IaC) easier to maintain, scale, and reuse across multiple environments.

Instead of duplicating Terraform code for every resource, modules allow us to write the infrastructure once and use it multiple times.

---

# 🎯 Learning Objectives

- Understand what Terraform Modules are
- Learn the difference between Root Module and Child Module
- Create and use a reusable local module
- Pass inputs to modules using variables
- Return outputs from modules
- Instantiate modules multiple times using `for_each`
- Consume modules from the Terraform Registry
- Understand module version pinning

---

# 📁 Project Structure

```text
example/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── registry-module.tf
│
└── modules/
    └── ec2_instance/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── README.md
```

---

# 📌 What is a Terraform Module?

A **Terraform Module** is a collection of Terraform configuration files that work together to create reusable infrastructure.

Modules help avoid duplicate code and make infrastructure easier to manage.

Think of a module like a function in programming—you define it once and reuse it multiple times with different inputs.

---

# Root Module vs Child Module

## Root Module

The directory where Terraform commands are executed.

Example:

```bash
terraform init
terraform plan
terraform apply
```

In this project, the **example/** directory is the Root Module.

---

## Child Module

The reusable module located inside:

```text
modules/ec2_instance/
```

The Root Module calls this Child Module whenever an EC2 instance needs to be created.

---

# Module Structure

The reusable EC2 module contains:

### main.tf

Creates the EC2 instance.

### variables.tf

Defines all input variables such as:

- AMI
- Instance Type
- Environment
- Subnet ID
- Security Group IDs
- Tags

### outputs.tf

Returns values back to the Root Module such as:

- Instance ID
- Public IP
- Private IP

---

# Module Inputs

The Root Module passes values into the Child Module.

Example:

```hcl
module "web_server" {
  source = "./modules/ec2_instance"

  name                   = "web"
  instance_type          = "t2.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
}
```

---

# Module Outputs

The Child Module returns useful information back to the Root Module.

Example:

```hcl
output "public_ip" {
  value = aws_instance.this.public_ip
}
```

The Root Module can access it as:

```hcl
module.web_server.public_ip
```

---

# Creating Multiple EC2 Instances Using for_each

Instead of writing multiple EC2 resources manually, the same module can be instantiated multiple times.

Example:

```hcl
module "servers" {
  source = "./modules/ec2_instance"

  for_each = toset([
    "app",
    "worker",
    "cache",
    "database",
    "monitoring"
  ])

  name                   = each.key
  instance_type          = "t2.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
}
```

Terraform automatically creates:

- dev-app
- dev-worker
- dev-cache
- dev-database
- dev-monitoring

without duplicating code.

---

# Registry Module

Terraform Registry provides reusable community and official modules.

Example:

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "terraweek-vpc"
  cidr = "10.0.0.0/16"
}
```

---

# Module Version Pinning

## Registry Module

```hcl
version = "~> 5.0"
```

Allows updates within version 5 but prevents automatic upgrades to version 6.

---

## Exact Version

```hcl
version = "= 5.1.2"
```

Only installs version 5.1.2.

---

## Version Range

```hcl
version = ">= 5.0, < 6.0"
```

Allows any version between 5.0 and 6.0.

---

## Git Tag

```hcl
module "example" {
  source = "git::https://github.com/org/repo.git//modules/ec2?ref=v1.2.0"
}
```

Uses a specific Git tag.

---

## Git Commit SHA

```hcl
module "example" {
  source = "git::https://github.com/org/repo.git//modules/ec2?ref=<commit-sha>"
}
```

Uses an immutable Git commit.

---

# Why Version Pinning Matters

Version pinning provides:

- Reproducible builds
- Stable deployments
- Protection against breaking changes
- Better collaboration across teams

---

# Benefits of Terraform Modules

- ♻️ Reusable Infrastructure
- 📦 Modular Design
- 🔒 Consistent Deployments
- 🚀 Easier Maintenance
- 📈 Scalable Infrastructure
- 👥 Team Collaboration
- 🧪 Easier Testing
- 🔄 Version Controlled Infrastructure

---

# Commands Used

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Preview Infrastructure

```bash
terraform plan
```

Create Infrastructure

```bash
terraform apply
```

View Outputs

```bash
terraform output
```

Destroy Infrastructure

```bash
terraform destroy
```

---

# Screenshots
![alt text](<Screenshot (631).png>)
![alt text](<Screenshot (642).png>) ![alt text](<Screenshot (632).png>) ![alt text](<Screenshot (633).png>) ![alt text](<Screenshot (634).png>) ![alt text](<Screenshot (637).png>) ![alt text](<Screenshot (638).png>) ![alt text](<Screenshot (639).png>) ![alt text](<Screenshot (640).png>) ![alt text](<Screenshot (641).png>)

# Key Takeaways

- Learned the difference between Root Modules and Child Modules.
- Built a reusable EC2 module.
- Passed inputs using variables.
- Returned outputs from modules.
- Created multiple EC2 instances using `for_each`.
- Explored Terraform Registry modules.
- Understood the importance of module version pinning.
- Learned how modules improve scalability, consistency, and maintainability in Infrastructure as Code.

---

## 🚀 Conclusion

Terraform Modules are the foundation of writing scalable and reusable Infrastructure as Code. They eliminate code duplication, improve consistency, simplify maintenance, and make it easier to manage infrastructure across multiple environments.

---

### 🏷️ Tags

**#Terraform #InfrastructureAsCode #AWS #DevOps #CloudComputing #TerraformModules #TrainWithShubham #TerraWeekChallenge**
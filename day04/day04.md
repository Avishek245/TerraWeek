# 🗄️ TerraWeek Day 4 – Terraform State & Remote Backends (Native Locking)

**Date:** 15 July 2026

---

# 🎯 Objective

The goal of Day 4 was to understand Terraform State, configure a Remote Backend using Amazon S3, and enable Native S3 State Locking for collaborative infrastructure management.

---

# 🛠️ Environment

| Component | Version |
|-----------|---------|
| Terraform | v1.15.8 |
| AWS Provider | ~> 6.0 |
| AWS CLI | v2 |
| Region | us-east-1 |
| Backend | Amazon S3 |
| State Locking | Native S3 (`use_lockfile = true`) |

---

# 📂 Project Structure

```text
day04/
│
├── backend_infra/
│   ├── terraform.tf
│   ├── resources.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── .terraform.lock.hcl
│
└── backend_demo/
    ├── terraform.tf
    ├── resources.tf
    ├── .terraform.lock.hcl
    └── .terraform/
```

---

# 📚 Learning Outcomes

- Understood Terraform State
- Explored Terraform State Commands
- Created Remote Backend
- Enabled Bucket Versioning
- Enabled Server Side Encryption
- Configured Native S3 Locking
- Stored Terraform State Remotely
- Destroyed Infrastructure Safely

---

# Task 1 – Understanding Terraform State

Terraform stores the current infrastructure information inside the **terraform.tfstate** file.

The state file contains:

- Resource IDs
- Metadata
- Dependencies
- Outputs
- Current Infrastructure State

### Why should we never edit it manually?

- Terraform may lose track of resources.
- State corruption may occur.
- Infrastructure can be recreated accidentally.

### Why should we never commit it to Git?

State files may contain:

- Resource IDs
- ARNs
- Public IPs
- Outputs
- Sensitive values

Always ignore:

```gitignore
*.tfstate
*.tfstate.*
.terraform/
```

---

# Task 2 – Terraform State Commands

## Initialize

```bash
terraform init
```

## Apply

```bash
terraform apply
```

## List Resources

```bash
terraform state list
```

## Show Resource

```bash
terraform state show random_pet.demo
```

## Display State

```bash
terraform show
```

---

# Task 3 – Bootstrap Backend Infrastructure

Created the backend infrastructure using local state.

Resources created:

- Amazon S3 Bucket
- Bucket Versioning
- Server Side Encryption
- Public Access Block

This bucket will be used later as the Terraform Remote Backend.

---

# Task 4 – Configure Remote Backend

Configured the S3 backend.

```hcl
terraform {

  backend "s3" {

    bucket       = "avishek-ghosh-terraweekchallange-2026"

    key          = "day04/backend_demo/terraform.tfstate"

    region       = "us-east-1"

    encrypt      = true

    use_lockfile = true

  }

}
```

---

# Native S3 Locking

Terraform v1.11+ supports native state locking.

```hcl
use_lockfile = true
```

Benefits:

- No DynamoDB required
- Prevents concurrent operations
- Safer team collaboration
- Simpler backend configuration

---

# Remote Backend Verification

Verified:

- Terraform state uploaded to Amazon S3
- State stored remotely
- Lock file created during operations
- Remote backend working successfully

---

# Cleanup

Destroyed the backend resources using:

```bash
terraform destroy
```

Since bucket versioning was enabled, Terraform couldn't delete the bucket until all object versions were removed from Amazon S3.

After deleting the versions, the bucket was successfully destroyed.

---

# 📸 Screenshot Evidence

## Screenshot

> ![alt text](<Screenshot (611).png>) ![alt text](<Screenshot (610).png>)
![alt text](<Screenshot (613).png>) 

> ![alt text](<Screenshot (616).png>) ![alt text](<Screenshot (615).png>)

> ![alt text](<Screenshot (617).png>)

![alt text](<Screenshot (619).png>)

![alt text](<Screenshot (620).png>)

![alt text](<Screenshot (629).png>) ![alt text](<Screenshot (621).png>) ![alt text](<Screenshot (623).png>) ![alt text](<Screenshot (624).png>) ![alt text](<Screenshot (625).png>)


---

# Commands Used

```bash
terraform init

terraform plan

terraform apply

terraform state list

terraform state show random_pet.demo

terraform show

terraform destroy
```

---

# Key Learnings

- Understood Terraform State and its purpose.
- Learned why state files should never be committed to Git.
- Practiced Terraform state commands.
- Configured a secure Remote Backend using Amazon S3.
- Enabled Bucket Versioning and Server Side Encryption.
- Used Native S3 State Locking (`use_lockfile = true`).
- Verified remote state storage in Amazon S3.
- Performed safe infrastructure cleanup.

---

# Conclusion

Day 4 focused on one of Terraform's most important concepts—**State Management**. I learned how Terraform tracks infrastructure using state files, configured a secure Amazon S3 remote backend, enabled native state locking with `use_lockfile = true`, explored Terraform state commands, and understood how these features support collaborative infrastructure management in production environments.

---

# 🏷️ Tags

`#Terraform` `#AWS` `#TerraformState` `#RemoteBackend` `#AmazonS3` `#InfrastructureAsCode` `#DevOps` `#CloudComputing` `#Automation` `#PlatformEngineering` `#LearnInPublic` `#TrainWithShubham` `#TerraWeekChallenge`
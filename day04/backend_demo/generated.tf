# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "avishek-ghosh-terraweekchallange-2026"
resource "aws_s3_bucket" "imported" {
  bucket              = "avishek-ghosh-terraweekchallange-2026"
  bucket_namespace    = "global"
  force_destroy       = false
  object_lock_enabled = false
  region              = "us-east-1"
  tags = {
    Name    = "avishek-ghosh-terraweekchallange-2026"
    Purpose = "tf-state-backend"
  }
  tags_all = {
    ManagedBy = "terraform"
    Name      = "avishek-ghosh-terraweekchallange-2026"
    Project   = "terraweek-2026"
    Purpose   = "tf-state-backend"
  }
}

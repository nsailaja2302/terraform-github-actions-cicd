provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Terraform-GitHub-Actions"
      Environment = "Portfolio"
      ManagedBy   = "Terraform"
    }
  }
}
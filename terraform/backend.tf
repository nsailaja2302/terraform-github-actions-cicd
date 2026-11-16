
terraform {
  backend "s3" {
    bucket         = "nsailaja-terraform-state-2026-12345"
    key            = "portfolio/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

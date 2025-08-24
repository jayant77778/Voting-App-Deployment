terraform {
  backend "s3" {
    bucket = "jayant-terraform-backend-2025-12345" # apna S3 bucket name
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

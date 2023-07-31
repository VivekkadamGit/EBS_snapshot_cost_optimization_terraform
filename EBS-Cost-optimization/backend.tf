terraform {
  backend "s3" {
    bucket = "my-aws-backend-bucket"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}
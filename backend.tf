terraform {
  backend "s3" {
    bucket = "terraform-state-sampleproject-nginx"
    key = "nginx/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}
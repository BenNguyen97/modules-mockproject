terraform {
  backend "s3" {
    bucket         = "luan-mock-project"
    key            = "networking/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    use_lockfile   = true  # Thay thế dynamodb_table
  }
}


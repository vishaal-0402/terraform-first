terraform {
  backend "s3" {
    bucket         = "terraform-demo-for-githubaction"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

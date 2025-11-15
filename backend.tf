terraform {
  backend "s3" {
    bucket         = "terraform-demo-for-githubactions"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "<your-lock-table>"
    encrypt        = true
  }
}

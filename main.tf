
provider "aws" {
  region = "us-east-1"
}

# ---------------------------
# VPC
# ---------------------------
resource "aws_vpc" "main" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "simple-vpc"
  }
}

# ---------------------------
# Output
# ---------------------------
output "vpc_id" {
  value = aws_vpc.main.id
}

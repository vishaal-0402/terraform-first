terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "state_bucket" {
  bucket = "${var.project}-state-${substr(md5(var.project), 0, 6)}"
  acl    = "private"

  tags = {
    Name    = var.project
    Managed = "terraform"
  }
}

# Example: create a tiny EC2 instance for demonstration (optional)
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  tags = {
    Name    = "${var.project}-example-instance"
    Project = var.project
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

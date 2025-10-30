terraform {
  backend "s3" {
    bucket         = "terraform-state-sahil-shahi"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-sahil-shahi"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-002a53be89c7bb5de" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Test-Sahil"
  }
}

provider "aws" {
  region = "us-east-1"
}

# Sahil Shahi - Lab 7b using count
resource "aws_instance" "sahil_ec2" {
  count         = 3
  ami           = "ami-002a53be89c7bb5de"   # YOUR AMI ID
  instance_type = "t3.micro"

  tags = {
    Name = "Sahil-Instance-${count.index}"
    Owner = "Sahil Shahi"
    Lab   = "Lab7b - Count"
  }
}

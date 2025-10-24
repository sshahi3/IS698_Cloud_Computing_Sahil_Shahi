# 2. Define the Provider
provider "aws" {
  region = "us-east-1" # Modify region if needed
}

# 3. Define the EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-002a53be89c7bb5de"   # Replace with a valid AMI ID in us-east-1
  instance_type = "t3.micro"                # fixed: no space after dot
  key_name      = "Ec2_KeyPair_Lab6"              # Replace with an existing key pair in AWS

  tags = {
    Name = "Lab6_EC2Terraform"              # Modify if needed
  }
}

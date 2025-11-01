# Lab 7b - Part 2 (for_each) - Sahil

# 1) Declare the variable used below
variable "instances" {
  type = map(string)
  default = {
    Sahil-Web1 = "t3.micro"
    Sahil-Web2 = "t3.micro"
    Sahil-Web3 = "t3.micro"
  }
}

# 2) One EC2 per map entry
resource "aws_instance" "sahil_ec2_each" {
  for_each      = var.instances
  ami           = "ami-002a53be89c7bb5de"  # your AMI in us-east-1
  instance_type = each.value

  tags = {
    Name  = each.key
    Owner = "Sahil Shahi"
    Lab   = "Lab7b - for_each"
  }
}

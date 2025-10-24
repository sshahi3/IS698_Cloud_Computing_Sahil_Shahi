# Only needed if this is a new folder for Lab 3:
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Example from professor
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"   # Example public CIDR
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"    # Example AZ
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"        # Example private CIDR
  availability_zone = "us-east-1b"         # Example AZ
}

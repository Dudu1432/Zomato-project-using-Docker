provider "aws" {
  region = var.region
  }

# VPC 
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc"
    }
  }

# SUBNET
resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet"
    }
  }

#INTERNET GATEWAY
resorce "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "igw"
    }
  }


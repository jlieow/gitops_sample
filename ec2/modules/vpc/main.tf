data "http" "icanhazip" {
   url = "http://icanhazip.com"
}

resource "aws_vpc" "spoke_vpc" {
  cidr_block           = var.spoke_vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "spoke_vpc"
  }
}

resource "aws_security_group" "spoke_security_group" {
  
  tags = {
    Name = "spoke_security_group"
  }

  vpc_id = aws_vpc.spoke_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${chomp(var.my_ip)}/32"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_internet_gateway" "spoke_igw" {
  vpc_id = aws_vpc.spoke_vpc.id

  tags = {
    Name = "spoke_igw"
  }
}
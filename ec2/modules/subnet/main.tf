resource "aws_subnet" "spoke_subnet_a" {
  vpc_id = var.spoke_vpc_id

  cidr_block        = var.spoke_subnet.a.cidr_block
  availability_zone = var.spoke_subnet.a.availability_zone

  tags = {
    Name = "${var.spoke_subnet.a.name}"
  }
}
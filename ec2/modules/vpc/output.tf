output "spoke_vpc_id" {
  value = aws_vpc.spoke_vpc.id
}

output "spoke_vpc_default_route_table_id" {
  value = aws_vpc.spoke_vpc.default_route_table_id
}

output "spoke_igw_id" {
  value = aws_internet_gateway.spoke_igw.id
}

output "spoke_vpc_security_group_id" {
  value = aws_security_group.spoke_security_group.id
}
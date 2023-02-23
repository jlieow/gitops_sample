provider "aws" {
  region  = var.region
  profile = var.profile
}

# Get local IP address
data "http" "icanhazip" {
   url = "https://ipv4.icanhazip.com/"
}

# Contains the VPCs, Security Groups, Internet Gateway and Route Tables
module "vpc" {
  source = "./modules/vpc"

  my_ip = data.http.icanhazip.response_body

  spoke_vpc_cidr_block = var.spoke_vpc_cidr_block
}

# Contains the subnets
module "subnet" {
  source = "./modules/subnet"

  spoke_vpc_id = module.vpc.spoke_vpc_id

  spoke_subnet = var.spoke_subnet
}

# Contains EC2s
module "vm_1" {
  source = "./modules/ec2"
  
  spoke_vpc_security_group_id = module.vpc.spoke_vpc_security_group_id
  spoke_subnet_a_id = module.subnet.spoke_subnet_a_id
  vm_name = "vm_1"
}

module "vm_2" {
  source = "./modules/ec2"
  
  spoke_vpc_security_group_id = module.vpc.spoke_vpc_security_group_id
  spoke_subnet_a_id = module.subnet.spoke_subnet_a_id
  vm_name = "vm_2"
}

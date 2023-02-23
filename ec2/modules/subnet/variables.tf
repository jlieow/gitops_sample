variable "spoke_vpc_id" {}

variable "spoke_subnet" {
    type = map(
        object(
            {
                name                = string
                cidr_block          = string
                availability_zone   = string
            }
        )
    )
}
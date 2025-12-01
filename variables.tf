# vpc variables

variable "vpc_cidr_block" {
    description = "the cidr block for vpc"
    type = string
}

variable "vpc_tenancy" {
    description = "the tenancy for vpc"
    type = string
}

variable "vpc_name" {
    description = "the tag name for vpc"
    type = string
}

# public subnet variables

variable "public_subnet_cidr" {
    description = "the cidr block for public subnet"
    type = string
}
variable "public_subnet_name" {
    description = "the name tag for public subnet"
    type = string
}
variable "public_subnet_az" {
    description = "the availability zone for public subnet"
    type = string
}

# private subnet variables

variable "private_subnet_cidr" {
    description = "the cidr block for private subnet"
    type = string
}
variable "private_subnet_name" {
    description = "the tag namefor private subnet"
    type = string
}
variable "private_subnet_az" {
    description = "the availability zone for private subnet"
    type = string
}

# route table variables

variable "public_route_table_name" {
    description = "the tag name for public route table"
    type = string
}
variable "public_route_cidr_block" {
    description = "the cidr block for public route"
    type = string
}
variable "internet_gateway_name" {
    description = "the tag name for internet gateway"
    type = string
}

# private route table variables

variable "private_route_table_name" {
    description = "the tag name for private route table"
    type = string
}
variable "private_route_cidr_block" {
    description = "the cidr block for private route"
    type = string
}
variable "nat_gateway_name" {
    description = "the tag name for nat gateway"
    type = string
}
# eip variables
variable "eip_name" {
    description = "the tag name for eip"
    type = string
}

# ec2 variables

variable "key_pair_name" {
    description = "the key name for ec2 instances"
    type = string
}

variable "public_key" {
    description = "the public key for ec2 instances"
    type = string
}

# security group variables

variable "security_group_name" {
    description = "the name of security group"
    type = string
}
variable "security_group_ingress" {
    description = "security group ingress rules"
    type = list(object({
        from_port = number
        to_port = number
        protocol = string 
        cidr_blocks = list(string)
    }))

}

variable "security_group_egress" {
    type = list(object({
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
    }))
}

# public ec2 instance variables
# example of simple variable types

variable "instance_name" {
    description = "the name tag for ec2 instance"
    type = string
}
variable "public_instance_type" {
    description = "the instance type for ec2 instance"
    type = string
}
variable "public_instance_ami_id" {
    description = "the ami id for ec2 instance"
    type = string
}
variable "associate_public_ip_address" {
    description = "wheather to associate public ip"
    type = bool

}

variable "instance_count" {
    description = "the count of ec2 instances"
    type = number
}

# private ec2 instance variables  
#example of complex variable type

variable "private_instances" {
    description = "the name tag for private ec2 instance"
    type = list(object({
        name = string
        type = string
        ami_id = string 
        associate_ip = bool

    }))
}


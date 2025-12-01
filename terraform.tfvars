# vpc values

vpc_cidr_block = "10.0.0.0/16"
vpc_name = "main_vpc"
vpc_tenancy = "default"

# subnet values

public_subnet_cidr = "10.0.1.0/24"
public_subnet_name = "public_subnet"
public_subnet_az = "us-east-1a"

# private subnet values

private_subnet_cidr = "10.0.2.0/24"
private_subnet_name = "private_subnet"
private_subnet_az = "us-east-1b"

# route table values
public_route_table_name = "public_rt"
public_route_cidr_block = "0.0.0.0/0"
internet_gateway_name = "mani_igw"

# private route table values

private_route_table_name = "private_rt"
private_route_cidr_block = "0.0.0.0/0"
nat_gateway_name = "mani_natgw"

# eip values
eip_name = "mani_eip"

# key pair

key_pair_name = "mani-key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDSlOYPWl41mMFGRQ6olPDk94R5nIHIIRG5kOM8m/3E1Czqupj/AaqJxwQkhC/S+V2TeTyjOp+wKMmIGOXYLt53QQfACgRy7Hkv0o1eo3mfHOSDVAiZ1O9bms8ZglO9rgZQQPXvXCQdYo3ldT0/oJ681nnHhUHEyxrvjuf6l0XDEkhEGo6ZnKIxwU77L33jSRq7b+6OdpahX4DWOXsQ6bmoYgpwJZdMwHDOGtFr7vh5ZE1ep3HmtPzi8sYD3Ga2OALG5dI75ljhWfTok+9wzrwh3IyUGhmTkwxtpQUMj3f47Lel3iJkw4Y1qZ+SncBFyOJLEAtI2xzgzdd932eWl0XM/4roqdSzOWkoUIXPzRQ3xwMRQ/5J/tGeGZ8VAYUD25FXwtXz70p3XpZdLB+0C01uenO1kebTbI2UHkf/ux2Cux9/66JyyiedMCTUNjveyZqk6d7ZDWjyZi+RafyojQblqalc2Y2XxTjt5cfuQ4QVqI/ScduZq799yaGYl7rhPVObZ3mj+MqDNFnxIN0TCWuGzU/58PHZz4+0UEwGDCx90WgpNxV3v5E+ot+jX8Rh3HnNbNLHZmGwz3pKjMM5oFeIlYrDpwDmYAwXtW2kI0znj/1K3GXH42VYhj52QpXIkueRZ9etTSpxXjZfG8Dk7zrDzig7zgV88QV7T8HOg355Bw== mani@thotamani"

# security group values ingress
security_group_name = "mani_sg"

security_group_ingress = [
    {

       from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
}   ,   
   {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
]


# security group values egress
security_group_egress = [{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}]


# public ec2 instance values

instance_name = "public_instance"
instance_count = 2
public_instance_type = "t3.medium"
public_instance_ami_id = "ami-0ecb62995f68bb549"
associate_public_ip_address = true

# private ec2 instance values

private_instances = [{

        name = "private_instance"
        count = 1
        type = "t3.medium"
        ami_id = "ami-0ecb62995f68bb549"
        associate_ip = false

}]


# instance counts for each type
# private_instance_count = 1


# key pair values
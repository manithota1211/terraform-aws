# creating key pair

resource "aws_key_pair" "deployer" {
    key_name = var.key_pair_name
    public_key = var.public_key

}

# creating security group
resource "aws_security_group" "sg" {
    name = var.security_group_name
    description = "security group for terraform"
    vpc_id = aws_vpc.main.id

    tags = {
        Name = var.security_group_name
    }
    dynamic "ingress" {
      for_each = var.security_group_ingress
      content {

        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks 
      }
    }
    dynamic "egress" {
      for_each = var.security_group_egress
      content {

        from_port = egress.value.from_port
        to_port = egress.value.to_port
        protocol = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
      }
    }
    
}

# creating public    ec2 instance

resource "aws_instance" "web_server" {
    ami = var.public_instance_ami_id
    count = var.instance_count
    instance_type = var.public_instance_type
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    key_name = var.key_pair_name
    associate_public_ip_address = var.associate_public_ip_address

    tags = {
        Name= var.instance_name
    }
}



# private ec2 instance using for_each

resource "aws_instance" "private_server_foreach" {
    for_each = { for idx, inst in var.private_instances : idx => inst }

 
    ami = each.value.ami_id
    instance_type = each.value.type
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    key_name = var.key_pair_name
    associate_public_ip_address = each.value.associate_ip

    tags = {
        Name= each.value.name
    }
}

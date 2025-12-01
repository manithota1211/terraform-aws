# creating VPC

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"
    

    

    tags = {
        Name = var.vpc_name
    }
}

# creating public subnet

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az


    tags = {
        Name = var.public_subnet_name
    }

}

# creating private subnet

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.private_subnet_az

    tags = {
        Name = var.private_subnet_name
    }

}
# creating internet gateway
resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = var.internet_gateway_name
    }

}

# creating public route table

resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.main.id
      route {
        cidr_block = var.public_route_cidr_block
        gateway_id = aws_internet_gateway.main_igw.id
      }

    tags = {
        Name = var.public_route_table_name
    }
   
}

# creating eip and nat gateway

resource "aws_eip" "nat_ip" {
    tags = {
        Name = var.eip_name

    
    }
}
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.public_subnet.id

    tags = {
        Name = var.nat_gateway_name
    }
}


# creating private route table
resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.main.id
      route {
        cidr_block = var.private_route_cidr_block
        nat_gateway_id = aws_nat_gateway.nat_gw.id
      }
    tags = {
      Name = var.private_route_table_name
  }
        
}

# creating public route table associations

resource "aws_route_table_association" "public_subnet" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route.id
}

# creating private route table associations

resource "aws_route_table_association" "private_subnet_bar" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route.id
}


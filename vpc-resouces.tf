# creating VPC

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main_vpc"
    }
}

# creating public subnet

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "public_subnet"
    }

}

# creating private subnet

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"

    tags = {
        Name = "private_subnet"
    }

}
# creating internet gateway
resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "internet_gateway"
    }

}

# creating public route table

resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.main.id
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main_igw.id
      }

    tags = {
        Name = "public_route_table"
    }
   
}

# creating eip and nat gateway

resource "aws_eip" "nat_ip" {
    tags = {
        Name = "nat_eip"

    
    }
}
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.public_subnet.id

    tags = {
        Name = "nat_gateway"
    }
}


# creating private route table
resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.main.id
      route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw.id
      }
    tags = {
      Name = "private_route_table"
  }
        
}

# creating public route table associations

resource "aws_route_table_association" "public_subnet" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route.id
}

# creating privateroute table associations

resource "aws_route_table_association" "private_subnet_bar" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route.id
}

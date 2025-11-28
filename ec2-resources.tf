# creating key pair

resource "aws_key_pair" "deployer" {
    key_name = "mani-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDoAv5kmCFOxsU1f8t87wKTZFlsD8qo/KhyoaOU0AnR6VXV4k+FQfs8LeA9aJvQTTHFNBj/prTffjpBfVzBcr0MaT+g1NMZtAr0xMzl+HC0yC+18nANF63I4MyAU7wEvCCsoiE1urOTjbCOXaozCuDEkQqePePKplI6GciCZzp6aY7PkygGGf2Xoge7kwqyt8JtJT9+OsGEQpFvRF6wp5S+dS+xDC8WRV2tw2G5tDk8HG2gnHwIIx0rwD6cJ+hlgTFjTDaWXM+fB6wU6V+EvxarzE/LCaqjHgcsqxMDjDTAT8M8cdAWf7YmVYWuFBJuUywVu6+iKBr1Vt0727xK0EOrMrjcFryVKy9PHPK8rGLajOHggphpKOTuDRcEuHpxREJSX2nTSlsfi66046XM9Lz0bptyxGN11cuKruGqEmDOycDhFaapNoGCui0y0e/xTGoOV7w+6QKaWg8rGcDaklljQvSTrXbKV3rjZ7ljj3m+voD+nu8XkqI8QiOHSzpMg3We5iRqEqqoqzGM9FEZFXK7tvZNxd3IK0/AwtNxoGchrxr+wYDBeaUh0f9Zklt2POMMplIV5eNJxbirL0qlOO6Ml+sJg5VcHafRIIEf+u3uqfiEP/NEbgZtWTipUukNwoXf1ZpXUQD0QpbVjImADGzntx+5ARbn+v7MZWhyDls6MQ== mani@thotamani"
}

# creating security group
resource "aws_security_group" "sg" {
    name = "mani_sg"
    description = "security group for terraform"
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "mani_sg"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# creating ec2 instance

resource "aws_instance" "web_server" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.medium"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    key_name = "mani-key"
    associate_public_ip_address = true

    tags = {
        Name= "terraform_instance"
    }
}

# creating private ec2 instance

resource "aws_instance" "private_server" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    key_name = "mani-key"
    associate_public_ip_address = false

    tags = {
        Name= "private_instance"
    }
}


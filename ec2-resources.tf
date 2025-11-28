# creating key pair

resource "aws_key_pair" "deployer" {
    key_name = "mani_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7fdxjK979Q1mKqXFD9hms5jSsjZ+3RUX8pafcj2gCfei9PnlGDP9n9isms96nNAM8wU9hJaMkW8MajKZFf4/gl4iW+q/T6nRAqAXavNbrQ544Zh7mwoILLUdFEQ6ldqjAKpLNvc76s82AtWNlluOOmyB+6iLEpks5gocqS5O9BPxuHTq4ATR/+lsOcQylHrhryV66haba2wdVAuiNQr2YH5Dug2db+GLLwJOoE/v4ybdUEEo4/YNZbEp+lg1wIWx8oKLTnbLflq/RhsyLr1ooD592/R5UmTOzU6zwLAuJpShBO6Hs1GWPxlqxLpIbJvTTaf3vGTKZk2xE16K3xEu8KmmDlRc+sz3FmzyLJQYl8HZKq+QAt0GV63ib2+Fvk4PMh+qQeDfgfuc62X4J1VGrSXzZAWWVmqQeMEV5DTxc6rmwOdfiPxZi6MNuJshm4b3kEmWGsPkx6dqxZaV8/GzzWP9hwyUZI0NI4Qb60QdPR3N8AigyzvkJ4nEmTk+fyExc7GjqisXyhd1pc0K57iNB6Y8q7yQ4MM+b0pJOLs6/zvf7AiVupc80QkkNRvDKHVCX505ypZS/ijpsZXv2k8idyJT+I5Bh+6qO58GZDXgZWJf0NDLuffwL4/D5o07cXV/JuYsC1lfbuey7gvwM8jxwumsGXelDjkrku7z5YjQtTw== mani@thotamani"
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

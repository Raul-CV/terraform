variable "ec2nombredb" {
  type = string
}

variable "ec2_2" {
  type = string
}

resource "aws_instance" "db" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    
    tags = {
        Name = var.ec2nombredb
    }
}

resource "aws_instance" "web" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.web_traffic.name ]
    user_data = file("server-script.sh")
    tags = {
        Name = var.ec2_2
    }
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

variable "ingress" {
    type = list(number)
    default = [80,443]
}

variable "egress" {
    type = list(number)
    default = [80,443]
}

resource "aws_security_group" "web_traffic" {
    name = "Allow Web traffic"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
        
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
        
    }
}

output "privateip" {
  value = aws_instance.db.private_ip
}

output "publicip" {
  value = aws_eip.web_ip.public_ip
}
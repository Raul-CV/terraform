provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-06373f703eb245f45"
    instance_type = "t2.micro"
}

resource "aws_eip" "elastic" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elastic.public_ip
}
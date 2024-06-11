provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-06373f703eb245f45"
    instance_type = "t2.micro"
}
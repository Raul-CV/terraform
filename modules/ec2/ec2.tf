variable "ec2nombre" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-06373f703eb245f45"
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2nombre
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
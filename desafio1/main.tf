provider "aws" {
    region = "eu-west-2"
}

variable "inputname" {
  type = string
  description = "Guardar el nombre de la VPC"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/24"

    tags = {
      Name = var.inputname
    }
}
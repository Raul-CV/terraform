provider "aws" {
  region = "eu-west-2"
}

module "ec2module" {
  source = "./ec2"
  ec2nombredb = "DB SERVER"
  ec2_2 = "Web Servidor"
}

output "modelo_outputs" {
  value = module.ec2module.privateip
}

output "modelo_outputs_1" {
  value = module.ec2module.publicip
}
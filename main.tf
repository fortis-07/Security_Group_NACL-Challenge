provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

module "network" {
  source             = "./modules/network"
  vpc_name           = var.vpc_name
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "instances" {
  source               = "./modules/instances"
  instance_name_prefix = var.instance_name_prefix
  subnet_ids           = module.network.public_subnet_ids
  sga_id               = module.security.sga_id
  sgb_id               = module.security.sgb_id
  key_name             = var.key_name
  ami_id               = data.aws_ami.amazon_linux_2.id
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
} 

module "subnet" {
  source     = "./modules/subnet"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source    = "./modules/route_table"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
} 

module "sg" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source     = "./modules/ec2_instance"
  subnet_id  = module.subnet.subnet_id
  sg_id      = module.sg.sg_id
  ami        = var.ami
  key_name   = var.key_name
} 
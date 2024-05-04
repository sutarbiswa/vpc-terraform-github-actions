module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr

}

module "sg" {
  source    = "./modules/sg"
  vpc_id_sg = module.vpc.vpc_id

}

module "ec2" {
  source  = "./modules/ec2"
  sg_id   = module.sg.security_group
  subnets = module.vpc.subnet_id

}

module "alb" {
  source       = "./modules/alb"
  sgs          = module.sg.security_group
  subnets      = module.vpc.subnet_id
  vpc_alb      = module.vpc.vpc_id
  instancesalb = module.ec2.instances

}

module "acm" {
  source           = "./modules/acm"
  domain_name      = var.domain_name
  alternative_name = var.alternative_name


}
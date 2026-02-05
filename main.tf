provider "aws" {
  region = var.region
}

# ---------------- VPC MODULE ----------------
module "vpc" {
  source       = "./module/vpc"

}

# ---------------- SG MODULE ----------------
module "sg" {
  source = "./module/sg"
  vpc_id = module.vpc.vpc_id
}

# ---------------- EC2 MODULE ----------------
module "ec2" {
  source         = "./module/ec2"
  instance_type  = var.instance_type
  #key_name       = var.key_name
  private_subnet_id = module.vpc.private_subnet_id
  ec2_sg         = module.sg.ec2_sg
}

# ---------------- ALB MODULE ----------------
module "alb" {
  source            = "./module/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg            = module.sg.alb_sg
  ec2_id            = module.ec2.ec2_id
}

module "vpc" {
  source              = "./modules/vpc"
  project             = var.project
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "s3" {
  source  = "./modules/s3"
  project = var.project
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  project    = var.project
  table_name = "${var.project}-user-logins"
}

module "ec2" {
  source            = "./modules/ec2"
  project           = var.project
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  http_source_cidr  = module.vpc.public_subnet_cidr
}

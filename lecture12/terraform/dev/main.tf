module "vpc" {
  source = "../modules/vpc"
}

module "subnet" {
  source = "../modules/subnet"

  vpc_id = module.vpc.vpc_id
}

module "routing" {
  source = "../modules/routing"

  vpc_id          = module.vpc.vpc_id
  public_subnet_a = module.subnet.public_subnet_a
  public_subnet_c = module.subnet.public_subnet_c
}

module "ec2" {
  source = "../modules/ec2"

  vpc_id          = module.vpc.vpc_id
  public_subnet_a = module.subnet.public_subnet_a
}

module "rds" {
  source = "../modules/rds"

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.subnet.db_subnet_group
  db_password          = "password"
}

module "alb" {
  source = "../modules/alb"

  vpc_id          = module.vpc.vpc_id
  public_subnet_a = module.subnet.public_subnet_a
  public_subnet_c = module.subnet.public_subnet_c
  ec2_id          = module.ec2.ec2_id
}



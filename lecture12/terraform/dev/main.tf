module "vpc_subnet" {
  source = "../modules/vpc-subnet"

  cidr_block = "10.0.0.0/16"
}

module "routing" {
  source = "../modules/routing"

  vpc_id          = module.vpc_subnet.vpc_id
  public_subnet_a = module.vpc_subnet.public_subnet_a
  public_subnet_c = module.vpc_subnet.public_subnet_c
}

module "ec2" {
  source = "../modules/ec2"

  vpc_id          = module.vpc_subnet.vpc_id
  public_subnet_a = module.vpc_subnet.public_subnet_a
}

module "rds" {
  source = "../modules/rds"

  vpc_id               = module.vpc_subnet.vpc_id
  db_subnet_group_name = module.vpc_subnet.db_subnet_group
  db_password          = "password"
}

module "alb" {
  source = "../modules/alb"

  vpc_id          = module.vpc_subnet.vpc_id
  public_subnet_a = module.vpc_subnet.public_subnet_a
  public_subnet_c = module.vpc_subnet.public_subnet_c
  ec2_id          = module.ec2.ec2_id
}

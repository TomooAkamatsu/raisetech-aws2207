variable "cidr_block" {
  default = "10.0.0.0/16"
}


### パブリックサブネット ####################

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-lecture12"
  }
}

### サブネット ####################

resource "aws_subnet" "subnets_a" {
  count = 2

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-a-${count.index}"
  }
}

resource "aws_subnet" "subnets_c" {
  count = 2

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 2)
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-c-${count.index + 2}"
  }
}

### サブネットグループ ####################

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [
    aws_subnet.subnets_a[1].id,
    aws_subnet.subnets_c[1].id
  ]
  tags = {
    Name = "db-subnet-group"
  }
}

### output ####################

output "vpc_id"{
  value = aws_vpc.vpc.id
}

output "public_subnet_a"{
  value = aws_subnet.subnets_a[0].id
}

output "public_subnet_c"{
  value = aws_subnet.subnets_c[0].id
}

output "db_subnet_group"{
  value = aws_db_subnet_group.db_subnet_group.name
}

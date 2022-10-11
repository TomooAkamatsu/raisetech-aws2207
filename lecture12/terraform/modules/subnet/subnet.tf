variable "vpc_id" {
}


### パブリックサブネット ####################

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-c"
  }
}

### プライベートサブネット ####################

resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet-c"
  }
}

### サブネットグループ ####################

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_c.id
  ]
  tags = {
    Name = "db-subnet-group"
  }
}

### output ####################

output "public_subnet_a"{
  value = aws_subnet.public_subnet_a.id
}

output "public_subnet_c"{
  value = aws_subnet.public_subnet_c.id
}

output "db_subnet_group"{
  value = aws_db_subnet_group.db_subnet_group.name
}
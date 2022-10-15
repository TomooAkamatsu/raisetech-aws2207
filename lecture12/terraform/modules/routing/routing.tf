variable "vpc_id" {
}

variable "public_subnet_a"{
}

variable "public_subnet_c"{
}

### IGW ####################
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "igw-lecture12"
  }
}

### ルートテーブル ####################
resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "rtb-lecture12"
  }
}

resource "aws_route_table_association" "rtb_ass_a" {
  subnet_id      = var.public_subnet_a
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "rtb_ass_c" {
  subnet_id      = var.public_subnet_c
  route_table_id = aws_route_table.rtb.id
}

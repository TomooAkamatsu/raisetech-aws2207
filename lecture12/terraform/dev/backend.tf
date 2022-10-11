# backendの定義
terraform {
  backend "s3" {
    bucket = "aws-lecture12-terraform"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
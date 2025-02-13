terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "vinith-13-02-2025"
    key    = "vgs/terraform.tfstate"
    region = "ap-south-2"   
  }
}

provider "aws" {
  region = "ap-south-2"
}

locals {
  region = "ap-south-2"
  name = "vgs_cluster"
  vpc_cidr = "10.123.0.0/16"
  azs      = ["ap-south-2a", "ap-south-2b"]
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]
  tags = {
    Example = local.name
  }
}



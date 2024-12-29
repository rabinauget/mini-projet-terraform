terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }

  required_version = "v1.10.3"

  backend "s3" {
    bucket = "terraform-backend-auget"
    key = "mini-projet-terraform.tfstate"
    region = "us-east-1"
    shared_credentials_files = ["../.secrets/credentials"]
    profile = "default"
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["../.secrets/credentials"]
  profile                  = "default"
}

module "miniec2" {
  source = "../modules/ec2module"
  instance_type = "t2.micro"
  aws_common_tag = {
    Name = "mini-projet-terraform"
  }
}

module "ebs" {
  source = "../modules/ebsmobule"
}

module "minieip" {
  source = "../modules/eipmodule"
  instance_id = module.miniec2.id
}

resource "aws_volume_attachment" "ebs" {
  device_name = "/dev/sdh"
  volume_id = module.ebs
  instance_id = module.miniec2.id
}
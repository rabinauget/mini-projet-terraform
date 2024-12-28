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
    shared_credentials_files = ["../../.secrets/credentials"]
    profile = "default"
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["../../.secrets/credentials"]
  profile                  = "default"
}


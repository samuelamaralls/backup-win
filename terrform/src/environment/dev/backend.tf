terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.45.0"
    }
  }
  required_version = "> 1.0.0"
}


terraform {
  backend "s3" {
    bucket = "zenir-homolog-terraform-kxc"
    key    = "terraform-dev.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}
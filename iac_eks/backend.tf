terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3"{
    bucket = "arquivo-de-estado"
    key = "eks.tfstate"
  } 
  
}

provider "aws" {
  region  = var.aws-region
}
terraform {
  backend "s3" {
    bucket         = "geopiner-terraform-state-12345"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

terraform {
    required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = var.aws_region
}


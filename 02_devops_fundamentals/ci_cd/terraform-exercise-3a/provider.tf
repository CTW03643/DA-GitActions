terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "da7-terraform-state"
    region = "eu-central-1"
    profile = "academy_trainee" 
    key    = "terraform-key"
  }
  
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  profile = "academy_trainee" 
}



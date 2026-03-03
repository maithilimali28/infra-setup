# Which cloud provider to use + version lock

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Store state remotely (recommended for teams)
  # backend "s3" {
  #   bucket = "notes-app-tfstate"
  #   key    = "prod/terraform.tfstate"
  #   region = "ap-south-1"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "notes-app"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}
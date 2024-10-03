terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "silpa-terraform-bucket"
    key    = "expense-sg-dev"
    region = "us-east-1"
    dynamodb_table = "terraform-dynamo"
  }
}



# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

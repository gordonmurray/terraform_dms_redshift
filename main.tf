
terraform {

  required_version = "1.1.8"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.20.1"

    }

  }

}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = "default"

  default_tags {
    tags = {
      TWApp = "terraform_dms_redshift"
    }
  }

}

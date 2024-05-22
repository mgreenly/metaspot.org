provider "aws" {
  region  = "us-east-2"
  profile = "root"
}

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17"
    }
  }

  backend "s3" {
    bucket = "tf.metaspot.org"
    key    = "tf-dnd"
    region = "us-east-2"

    dynamodb_table = "tf.metaspot.org"
    encrypt        = true
  }
}

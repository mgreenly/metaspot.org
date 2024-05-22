#
# This file bootstraps terraform. It's state is static
# and checked into git. It only creates the bucket and
# dynamodb table for the terraform lock.  It's unlikely
# it will ever need to change.
#

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17"
    }
  }
}


provider "aws" {
  region  = "us-east-2"
  profile = "root"
}

resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tf.metaspot.org"
}

resource "aws_dynamodb_table" "tf_dynamo_table" {
  name = "tf.metaspot.org"
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

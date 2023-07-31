

provider "aws" {
  region = "us-west-2"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "my-company-disha-data" {
  bucket = "my-company-disha-data"  # Change this to a unique bucket name

  acl    = "private"  # Access control list for the bucket

  tags = {
    Name        = "My Example Bucket"
    Environment = "Dev"
  }
}
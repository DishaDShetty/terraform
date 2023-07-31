module "s3_buckets" {
  rule {
    resource_types = "aws_s3_bucket"
    attribute      = "bucket"
    pattern        = "^[a-z0-9.-]{3,63}$"
    message        = "S3 bucket name must be between 3 and 63 characters, containing only lowercase letters, numbers, hyphens, and periods."
  }
}

module "s3_bucket_prefix" {
  rule {
    resource_types = "aws_s3_bucket"
    attribute      = "bucket"
    pattern        = "^my-company-"
    message        = "S3 bucket name must start with 'my-company-' prefix."
  }
}

module "s3_bucket_suffix" {
  rule {
    resource_types = "aws_s3_bucket"
    attribute      = "bucket"
    pattern        = "-data$"
    message        = "S3 bucket name must end with '-data' suffix."
  }
}

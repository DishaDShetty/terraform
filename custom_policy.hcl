rule "s3_bucket_naming" {
  condition = not regex("^my-company-[a-z0-9.-]{3,63}-data$", my-example-bucket)
  message = "S3 bucket name must follow the naming convention: my-company-{name}-data"
}

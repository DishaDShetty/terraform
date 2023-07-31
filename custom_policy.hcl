custom {
  name = "s3_bucket_naming"
  message = "S3 bucket name must follow the naming convention: my-company-{name}-data"

  check = <<EOT
    not regex("^my-company-[a-z0-9.-]{3,63}-data$", my-example-bucket)
  EOT
}

rule "s3_bucket_naming" {
  condition = not regex("^my-company-[a-z0-9.-]{3,63}-data$", var.resource_name)
  message = "S3 bucket name must follow the naming convention: my-company-{name}-data"
}

custom {
  name     = "s3_bucket_naming"
  message  = "S3 bucket name must follow the naming convention: my-company-{name}-data"
  argument = "not regex(\"^my-company-[a-z0-9.-]{3,63}-data$\", var.resource_name)"
}

module "bucket_naming_convention" {
  enabled = true
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.0.0"
}

rule {
  enabled = true

  # Ensure the resource type is a "module"
  # (This can be set to "module" to enforce the naming convention only on module resources)
  resource_types = ["module"]

  # Regular expression to enforce the naming convention
  pattern = "^module\\.bucket_naming_convention$"

  # Custom error message shown when the naming convention is violated
  message = "S3 bucket naming convention violation. Module should be named 'bucket_naming_convention'."
}

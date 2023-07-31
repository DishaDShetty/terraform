policy "s3_bucket_naming_convention" {
  source = "github.com/terraform-linters/tflint-ruleset-aws"

  rule "AWS01" {
    enabled = true
    provider = "aws"
    resource_types = ["aws_s3_bucket"]
    condition = <<EOT
      all {
        startswith("my-app-", lower(var.name))
        regex("^[-a-zA-Z0-9]+$", var.name)
      }
    EOT
    message = "S3 bucket name should start with 'my-app-' and contain only alphanumeric characters and hyphens."
  }
}

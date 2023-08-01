provider "aws" {
  alias  = "apprunner"
  region = "us-west-2"  # Replace this with the desired AWS region for App Runner

  # You can set different AWS credentials for App Runner here, if needed
  # access_key = "your_access_key"
  # secret_key = "your_secret_key"
}
resource "aws_apprunner_service" "example_app_runner" {
  provider = aws.apprunner  # Use the aliased provider

  name = "example-apprunner-service"
  repository {
    # Replace the following with the details of your container image
    image_repository_type = "ECR"  # Use "ECR" if you are using Amazon ECR, "ECR_PUBLIC" for public images, or "ECR_PRIVATE" for private images.
    image_uri             = "your-ecr-repo-uri:latest"  # Replace with your container image URI
  }

  # Optionally, you can define a custom domain mapping for the App Runner service
  custom_domain {
    domain_name = "example.domain.com"
    enable_https = true
  }

  # You can define environment variables and other configuration for your container here
  source_configuration {
    authentication_configuration {
      access_role_arn = "arn:aws:iam::123456789012:role/service-role/AppRunner-YourAppRunnerServiceRole-123456789012"  # Replace with the ARN of the role that grants App Runner permission to access your ECR repository
    }
  }
}

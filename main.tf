

provider "aws" {
  region = "us-west-2"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "my-co" {
  bucket = "my-com"  # Change this to a unique bucket name

  acl    = "private"  # Access control list for the bucket

  tags = {
    Name        = "My Example Bucket"
    Environment = "Dev"
  }
}
resource "aws_apprunner_service" "example_app_runner" {
  name        = "example-apprunner-service"
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

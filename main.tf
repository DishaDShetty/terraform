

provider "aws" {
  region = "us-west-2"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "my-co" {
  bucket = "my-company-disha-data"  # Change this to a unique bucket name

  acl    = "private"  # Access control list for the bucket

  tags = {
    Name        = "My Example Bucket"
    Environment = "Dev"
  }
}
resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the AMI ID of the desired instance image
  instance_type = "t2.micro"  # Replace with the instance type you want to use

  # Optional: Define tags to label your instance (key-value pairs)
  tags = {
    Name = "Example Instance"
  }
}


provider "aws" {
  region = "us-west-2"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "some s3 bucket" {
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
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "my_subnet" {
  count = 2
  
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  
  availability_zone = "us-east-1a"  # Change this to your desired availability zone
  
  tags = {
    Name = "MySubnet-${count.index}"
  }
}



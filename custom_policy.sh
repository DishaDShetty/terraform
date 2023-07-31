#!/bin/bash

# Enforce naming convention for S3 buckets
# Bucket name must start with "my-company-" and end with "-data"

# Get the list of S3 bucket names from Terraform files
bucket_names=$(grep -E -o 'resource "aws_s3_bucket" "[^"]+"' *.tf | awk '{print $3}' | sed 's/"//g')
echo bucket_names
# Check each bucket name against the naming convention
for name in $bucket_names; do
  if ! echo "$name" | grep -qE '^my-company-[a-z0-9.-]{3,63}-data$'; then
    echo "S3 bucket name does not follow the naming convention: my-company-{name}-data"
    exit 1
  fi
done

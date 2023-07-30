#!/bin/bash

# threshold_instance_type="large"
# instance_types=$(cat infracost_output.json | jq eval '.[] | select(.name | test("AWS EC2")) | .resources[].values.instance_type' -)

# if [[ "$instance_types" == *"$threshold_instance_type"* ]]; then
#   echo "Error: Instances of type \"$threshold_instance_type\" found in the infrastructure. Policy violation."
#   exit 1
# fi

# threshold=3
# cost=$(cat infracost_output.json | jq eval '.[] | select(.name | test("AWS EC2")) | .monthlyCost.value' -)

# if (( $(echo "$cost > $threshold" | bc -l) )); then
#   echo "Error: Estimated cost ($cost) exceeds the threshold of $threshold"
#   exit 1
# fi
# Use jq to parse JSON output and extract the totalMonthlyCost value for AWS EC2 instances
ec2Cost=$(jq '.[] | select(.productFamily == "Compute Instance") | .totalMonthlyCost' infracost_output.json)

# Remove commas from the numeric value (if any)
ec2Cost=$(echo "$ec2Cost" | tr -d ',')

# Define the threshold for the maximum cost (e.g., $12)
threshold=12

# Compare the EC2 instance cost against the threshold
if (( $(echo "$ec2Cost > $threshold" | bc -l) )); then
  echo "Error: EC2 instance cost (\$$ec2Cost) exceeds the threshold of \$$threshold"
  exit 1
fi
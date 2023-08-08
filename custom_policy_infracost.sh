#!/bin/bash


threshold=3
# ec2 = jq -r '.projects[0].pastBreakdown.resources[] | select(.resourceType == "aws_instance") | .monthlyCost' infracost_output.json
# echo $ec2
# cost=$(cat infracost_output.json | jq eval '.[] | select(.name | test("AWS EC2")) | .monthlyCost.value' -)

# if (( $(echo "$cost > $threshold" | bc -l) )); then
#   echo "Error: Estimated cost ($cost) exceeds the threshold of $threshold"
#   exit 1
# fi
# Use jq to parse JSON output and extract the totalMonthlyCost value for AWS EC2 instances
#cat /home/runner/work/terraform/terraform/infracost_output.json
ec2Cost=$(jq -r '.projects[0].pastBreakdown.resources[] | .resourceType[] | .monthlyCost' infracost_output.json )

#ec2Cost=$(jq -r '.projects[0].pastBreakdown.resources[] | select(.resourceType == "aws_instance") | .monthlyCost' infracost_output.json )
echo $ec2Cost
if (( $(echo "$ec2Cost > $threshold" | bc -l) )); then
  echo "Error: Estimated EC2 cost ($ec2Cost) exceeds the threshold of $threshold"
  exit 1
fi
#$(jq -r '.projects[0].pastBreakdown.resources[] | "\(.name): \(.monthlyCost)"' infracost_output.json)

















#cat infracost_output.json | jq -r '.projects[0].pastBreakdown.resources[] | select(.resourceType == "aws_instance") | .monthlyCost'> resource_costs.txt














# # Remove commas from the numeric value (if any)
# ec2Cost=$(echo "$ec2Cost" | tr -d ',')

# # Define the threshold for the maximum cost (e.g., $12)
# threshold=12

# # Compare the EC2 instance cost against the threshold
# if (( $(echo "$ec2Cost > $threshold" | bc -l) )); then
#   echo "Error: EC2 instance cost (\$$ec2Cost) exceeds the threshold of \$$threshold"
#   exit 1
# fi
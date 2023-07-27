#!/bin/bash

threshold_instance_type="large"
instance_types=$(cat /home/runner/work/terraform/terraform/infracost_output.yml | yq eval '.[] | select(.name | test("AWS EC2")) | .resources[].values.instance_type' -)

if [[ "$instance_types" == *"$threshold_instance_type"* ]]; then
  echo "Error: Instances of type \"$threshold_instance_type\" found in the infrastructure. Policy violation."
  exit 1
fi


threshold=3
cost=$(cat /home/runner/work/terraform/terraform/infracost_output.yml | yq eval '.[] | select(.name | test("AWS EC2")) | .monthlyCost.value' -)

if (( $(echo "$cost > $threshold" | bc -l) )); then
  echo "Error: Estimated cost ($cost) exceeds the threshold of $threshold"
  exit 1
fi

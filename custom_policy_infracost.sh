#!/bin/bash

threshold_instance_type="large"
instance_types=$(cat infracost-usage.yml | yq eval '.[] | select(.name | test("AWS EC2")) | .resources[].values.instance_type' -)

if [[ "$instance_types" == *"$threshold_instance_type"* ]]; then
  echo "Error: Instances of type \"$threshold_instance_type\" found in the infrastructure. Policy violation."
  exit 1
fi


threshold=3
cost=$(cat infracost-usage.yml | yq eval '.[] | select(.name | test("AWS EC2")) | .cost_monthly.value' -)

if (( $(echo "$cost > $threshold" | bc -l) )); then
  echo "Error: Estimated cost ($cost) exceeds the threshold of $threshold"
  exit 1
fi

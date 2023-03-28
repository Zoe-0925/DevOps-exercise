#!/bin/bash

### Please install jq if you have not already
# For Ubuntu or Debian-based systems
# sudo apt-get install jq

# For macOS using Homebrew
# brew install jq

json_file=./ec2-describe-instances.json

# Extract a specific value using jq, for example, getting the value of the 'name' key in the JSON object
name=$(jq -r '.name' "$json_file")

echo "The name in the JSON file is: $name"
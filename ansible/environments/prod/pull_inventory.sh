#!/bin/bash
# Assign env variable
environment="prod"
cd ../terraform/$environment
# Pull state
rm terraform.tfstate
terraform state pull > terraform.tfstate
# Load inventiry
terraform-inventory -list terraform.tfstate

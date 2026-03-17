#!/bin/bash
#output needs to be changed in terraform to show ip addresses
cd /home/user/linode/linux-svr/terraform
terraform apply -auto-approve

echo "Lab is live. You have 60 minutes."
sleep 3600

echo "Time is up. Destroying infrastructure..."
terraform destroy -auto-approve
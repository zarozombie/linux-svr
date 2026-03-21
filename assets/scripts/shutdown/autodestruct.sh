#!/bin/bash
#output needs to be changed in terraform to show ip addresses
cd /home/user/linode/linux-svr/terraform
terraform apply -auto-approve

echo "Lab is live. You have 60 minutes."
# 1 Hour
sleep 3600

#5 mins
sleep 300

#edit to target node destruction terraform destroy -target=linode_instance.k3s_worker_heavy
echo "Time is up. Destroying infrastructure..."
terraform destroy -target=linode_instance.k3s_worker_heavy
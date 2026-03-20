echo "terraform destroy -target=linode_instance.k3s_worker_heavy -auto-approve" | at now + 5 minutes

#check job
#atq

#cancle job
#atrm [Job ID]
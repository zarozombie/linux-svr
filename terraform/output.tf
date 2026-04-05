#get ip address after creatsion
#need to get output of both ip addresses
output "instance_public_ip" {
  description = "The public IPv4 address of the Linode instance"

#  This is depreciated and as api returns an arra/list of ip with ipv4 and 6
#  value       = linode_instance.test_block.ip_address

#  list can come back unordered but as this is on ip I will use one output updated in last bit of code
#  value       = linode_instance.test_block.ipv4[0]
  value       = one(linode_instance.test_block.ipv4)
}

output "instance_private_ip" {
  description = "The private IPv4 address (if enabled)"
  value       = linode_instance.test_block.private_ip_address
}

output "ssh_connection_string" {
  description = "Helper string to SSH into the box"
  #this did fail as the info may produce as a unordered list ipv4
#  value       = "ssh root@${linode_instance.test_block.ipv4}"

#  Solution from AI
  value       = "ssh root@${one(linode_instance.test_block.ipv4)}"

}
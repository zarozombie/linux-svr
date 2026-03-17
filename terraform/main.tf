resource "linode_instance" "test_block" {
  label           = "terraform-node-test-01"
  image           = "linode/ubuntu24.04"

  #revision to image
#  image           = "linode/debian11"

  region          = "us-east"
  type            = "g6-nanode-1"

  # revision to type
#  type            = "g6-standard-1" # 2GB RAM / 1 vCPU

#safeguard agains terriform destroy


#  omited authorized_key for testing
#  authorized_keys = ["ssh-rsa AAAAB3Nza..."]

#  managed by terraform.tfvars
  root_pass       = var.passwd

#   group is depreciated and tags are now used
#  group           = "Test-Development"
  tags            = ["terraform", "linux"]

    metadata {
        user_data = base64encode(<<-EOF
        #cloud-config
        package_update: true
        packages:
            - htop
            - git
            - tmux
            - vim
            - python3
            - pip
            - python3-venv
            - iproute2

        EOF
        )
    }

    /*
    lifecycle {
        prevent_destroy = true
    }  

    */


}

#Provisioners commands to update current instance
/*
resource "linode_instance" "test_block" {
  # ... your existing label, image, region, etc ...

  # Use this instead of metadata to prevent "Force Replacement"
  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y htop git tmux vim python3 python3-pip python3-venv iproute2"
    ]

    connection {
      type     = "ssh"
      user     = "root"
      # This pulls the IP of the instance we are currently configuring
      host     = self.ip_address
      # Ensure this points to your private key on your local VM
      private_key = file("~/.ssh/id_rsa") 
    }
  }
}
*/

# furture metadata implementation including firewall
/*
    metadata {
        user_data = base64encode(<<-EOF
        #cloud-config
        package_update: true
        packages:
            - htop
            - git
            - ufw
            - tmux
            - vim
            - python3
            - pip
            - python3-venv
            - iproute2
        runcmd:
            - systemctl enable ufw
            - ufw allow ssh
            - ufw --force enable
        EOF
        )
    }

*/
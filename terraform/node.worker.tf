resource "linode_instance" "test_block" {
  label           = "terraform-node-test-01"
  image           = "linode/ubuntu24.04"
  region          = "us-east"
  type            = "g6-nanode-1"

#safeguard agains terriform destroy
    lifecycle {
        prevent_destroy = true
    }  

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
}

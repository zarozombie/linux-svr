
# The "Muscle" (The New Heavy Worker)
resource "linode_instance" "k3s_worker_heavy" {
  label  = "k3s-worker-heavy"
  image  = "linode/ubuntu24.04"
  region = "us-east"
  type   = "g6-standard-2" # 4GB RAM - 4x the Master!

  authorized_keys = [chomp(file("../assets/keys/id_superlab.pub"))]
  root_pass       = var.passwd

  tags  = ["linux-K3s", "worker-node"]
}

#automate ip gathering to .fttpl  and generate ini for inventory.ini
resource "linode_volume" "k3s_data" {
  label  = "superlab-persistence"
  region = var.region
  size   = 10 # 10GB is roughly $1/mo

  lifecycle {
    prevent_destroy = true
  }
}

output "volume_id" {
  value = linode_volume.k3s_data.id
}

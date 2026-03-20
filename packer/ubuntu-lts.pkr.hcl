packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.5"
      source  = "github.com/hashicorp/virtualbox"
    }
    ansible = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "virtualbox-iso" "ubuntu-lts" {
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot<enter>"
  ]
  boot_wait        = "5s"
  cpus             = 2
  disk_size        = 20480
  guest_os_type    = "Ubuntu_64"
  headless         = false # Set to true once you verify it works to skip the GUI lag
  http_directory   = "http"
# Use the 24.04.1 (or latest) point release link
  iso_url      = "file://./iso/ubuntu-24.04.1-live-server-amd64.iso"
  iso_checksum = "c3514bf0056180d09376462a7a1b4f213c1d6e8ea67fae5c25099c6fd3d8274b"
  memory           = 2048
  ssh_password     = "vagrant"
  ssh_username     = "vagrant"
  ssh_timeout      = "20m"
  shutdown_command = "echo 'vagrant' | sudo -S shutdown -P now"
}

build {
  sources = ["source.virtualbox-iso.ubuntu-lts"]
}

#this is a good way to produce a logical seperation of concern and multi code rediness
terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "3.0.0" 
    }
  }
}

provider "linode" {
  token = var.token
}
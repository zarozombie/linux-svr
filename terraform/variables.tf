variable "token" {
  description = "Linode API Token"
  sensitive   = true
}

variable "region" {
  default = "us-east" # Choose the region closest to Michigan
}

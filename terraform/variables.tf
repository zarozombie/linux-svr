variable "token" {
  description = "Linode API Token"
  sensitive   = true
}

variable "passwd" {
  description = "initial password"
  sensitive   = true
}

variable "region" {
  default = "us-east" # Choose the region closest to Michigan
}

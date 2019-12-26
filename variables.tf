variable metadata {
  type = "map"

  default {
    project = "rs-jenkins"
    env     = "dev"
  }
}

variable "vpc_id" {
  default = "vpc-f2763d99"
}

variable "cidrs" {
  type = "map"

  default = {
    rs_network = "0.0.0.0/0"
  }
}

variable "bitbucket_network" {
  type    = "list"
  default = ["104.192.136.0/21", "34.198.203.127/32", "34.198.178.64/32", "34.198.32.85/32","37.233.62.175/32"]
}

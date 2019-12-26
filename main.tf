provider "aws" {
  region  = "eu-central-1"
  profile = "rs-dev"
}

resource "tls_private_key" "jenkins" {
  algorithm = "RSA"
}

resource "aws_key_pair" "jenkins" {
  key_name   = "${var.metadata["project"]}/${var.metadata["env"]}"
  public_key = "${tls_private_key.jenkins.public_key_openssh}"
}

data "aws_vpc" "rs-dev" {
  id = "${var.vpc_id}"
}

data "aws_route53_zone" "rs-dev" {
  name         = "raresociopath.com."
  private_zone = false
}

data "aws_subnet_ids" "public" {
  vpc_id = "${var.vpc_id}"

  tags {
    role = "dev"
  }
}

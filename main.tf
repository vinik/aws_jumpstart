variable "aws_access_key" {
  type = "string"
  description = "Aws access key"
}
variable "aws_secret_key" {
  type = "string"
  description = "Aws secret key"
}

variable "prefix" {
  type = "string"
  description = "The prefix for all your objects"
}

variable "domain" {
  type = "string"
  description = "Domain (like example.com)"
}

variable "keyfile" {
  type = "string"
  default = "~/.ssh/id_rsa.pub"
  description = "Path to a key file from aws"
}

variable "region" {
  type = "string"
  default = "us-east-1"
  description = "Your aws region of choice"
}

# ==================================

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_key_pair" "aws_deployer_key" {
  key_name = "${var.prefix}"
  public_key = "${file("${var.keyfile}")}"
}

resource "aws_security_group" "default_security_group" {
  name = "${var.prefix}-default_secgrp"
  description = "Rules ${var.prefix}"
}

# Domain
resource "aws_route53_zone" "primary" {
   name = "${var.domain}"
}

provider "aws" {
  region = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXX"
}

module "teleport_server" {
  source = "git::https://github.com/cemdorst/terraform-modules.git//terraform-aws-teleport?ref=v0.0.3"
  cluster_name        = "teleport"
  number_of_instances = 1
  ssh_keyname         = "cemdorst"
}

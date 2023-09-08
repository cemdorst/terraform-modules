terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.29.0"
    }
  }
}

locals {
  sizes = {
    nano      = "s-1vcpu-1gb"
    micro     = "s-2vcpu-2gb"
    small     = "s-2vcpu-4gb"
    medium    = "s-4vcpu-8gb"
    large     = "s-6vcpu-16gb"
    x-large   = "s-8vcpu-32gb"
    xx-large  = "s-16vcpu-64gb"
    xxx-large = "s-24vcpu-128gb"
    maximum   = "s-32vcpu-192gb"
  }
}

data "digitalocean_image" "this" {
  slug  = var.image_name
}

resource "digitalocean_droplet" "this" {
  name      = var.name
  image     = data.digitalocean_image.this.image
  region    = var.region
  size      = local.sizes[var.droplet_size]

  lifecycle {
    ignore_changes = [
      user_data,
    ]
  }

  ssh_keys = var.ssh_keys
  tags     = var.tags
}

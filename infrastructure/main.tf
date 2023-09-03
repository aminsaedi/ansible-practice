terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
    token = var.digital_ocean_token
}

resource "digitalocean_droplet" "loadbalancer" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "lb.aminsaedi.bio"
  monitoring = true
}

resource "digitalocean_droplet" "app1" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "app1.aminsaedi.bio"
  monitoring = true
}

resource "digitalocean_droplet" "app2" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "app2.aminsaedi.bio"
  monitoring = true
}

resource "digitalocean_droplet" "db" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "db.aminsaedi.bio"
  monitoring = true
}
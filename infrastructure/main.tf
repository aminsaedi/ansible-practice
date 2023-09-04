terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "digitalocean" {
    token = var.digital_ocean_token
}

provider "cloudflare" {
  api_token = var.cloudflare_token 
}



data "digitalocean_ssh_key" "amin_pop_os" {
  name = "amin_pop_os"
}

resource "digitalocean_droplet" "loadbalancer" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "lb.aminsaedi.bio"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.amin_pop_os.id
  ]
}

resource "digitalocean_droplet" "app1" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "app1.aminsaedi.bio"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.amin_pop_os.id
  ]
}

resource "digitalocean_droplet" "app2" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "app2.aminsaedi.bio"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.amin_pop_os.id
  ]
}

resource "digitalocean_droplet" "db" {
  image = "debian-12-x64"
  size = "s-1vcpu-512mb-10gb"
  name = "db.aminsaedi.bio"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.amin_pop_os.id
  ]
}

# Domain name configurations

resource "cloudflare_record" "loadbalancer_domain" {
  zone_id = var.cloudflare_zone_id
  name = "lb"
  value = digitalocean_droplet.loadbalancer.ipv4_address
  type = "A"
  proxied = false
}



resource "cloudflare_record" "db_domain" {
  zone_id = var.cloudflare_zone_id
  name = "db"
  value = digitalocean_droplet.db.ipv4_address
  type = "A"
  proxied = false
}


resource "cloudflare_record" "app1_domain" {
  zone_id = var.cloudflare_zone_id
  name = "app1"
  value = digitalocean_droplet.app1.ipv4_address
  type = "A"
  proxied = false
}


resource "cloudflare_record" "app2_domain" {
  zone_id = var.cloudflare_zone_id
  name = "app2"
  value = digitalocean_droplet.app2.ipv4_address
  type = "A"
  proxied = false
}

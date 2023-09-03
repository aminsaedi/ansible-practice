output "lb_ip" {
  value = digitalocean_droplet.loadbalancer.ipv4_address
}

output "app1_ip" {
  value = digitalocean_droplet.app1.ipv4_address
}

output "app2_ip" {
  value = digitalocean_droplet.app2.ipv4_address
}

output "db_ip" {
  value = digitalocean_droplet.db.ipv4_address
}
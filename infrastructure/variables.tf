variable "digital_ocean_token" {
  description = "Digital Ocean API token"
  type        = string
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
}

variable "region" {
  description = "Region to deploy to"
  type        = string
}

variable "cloudflare_token" {
  description = "Your cloudflare API token with write access to your target zone"
  type = string
}

variable "cloudflare_zone_id" {
  description = "Your cloudflare zone id"
  type = string
}

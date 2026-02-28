variable "pve_api_url" { type = string }
variable "pve_api_token_id" { type = string }
variable "pve_api_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

variable "target_node" { type = string }
variable "hostname" { type = string }
variable "ostemplate" { type = string }
variable "vmid" { type = number }

variable "bridge" { type = string }
variable "ip" { type = string }
variable "gateway" { type = string }

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key path (GitHub self-hosted runner -> IaC Controller)"
}
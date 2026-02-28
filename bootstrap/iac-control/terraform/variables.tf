variable "pve_api_url" { type = string, description = "Proxmox API URL"}
variable "pve_api_token_id" { type = string, description = "Proxmox API token ID" }
variable "pve_api_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

variable "target_node" { type = "string" }
variable "hostname" { type = "string" }
variable "ostemplate" { type = "string" }
variable "vmid" { type = number }

variable "bridge" { type = string, description = "LXC bridge/vnet" }
variable "ip" { type = string, description = "Runner LXC IP/CIDR" }
variable "gateway" { type = string, description = "Runner LXC gateway"}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key path (GitHub self-hosted runner -> IaC Controller)"
}
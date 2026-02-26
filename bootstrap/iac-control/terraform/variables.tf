variable "pve_api_url" {
  type        = string
  description = "Proxmox API URL"
  default = "https://192.168.100.1:8006/api2/json"
}

variable "pve_api_token_id" {
  type        = string
  description = "Proxmox API token ID"
  default = "terraform@pam!iac"
}

variable "pve_api_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

variable "bridge" {
  type        = string
  description = "LXC bridge/vnet"
  default = "vnet1"
}

variable "ip_cidr" {
  type        = string
  description = "Runner LXC IP/CIDR"
  default = "192.168.100.101/24"
}

variable "gateway" {
  type        = string
  description = "Runner LXC gateway"
  default = "192.168.100.1"
}

variable "root_password" {
  type        = string
  description = "Root password for the runner LXC"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key path (GitHub self-hosted runner -> IaC Controller)"
}
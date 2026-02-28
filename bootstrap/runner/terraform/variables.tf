variable "pve_api_url" {
  type = string
  description = "Proxmox API URL"
}
variable "pve_api_token_id" {
  type = string
  description = "Proxmox API token ID"
}
variable "pve_api_token_secret" {
  type = string
  description = "Proxmox API token secret"
  sensitive = true
}

variable "target_node" { type = string }
variable "template_id" { type = string }

variable "bridge" { type = string }
variable "gateway" { type = string }
variable "cidr" { 
  type = number
  default = 24
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key path"
}

variable "control_plane" {
  type = object({
    vmid = number
    name = string
    ip = string
    cores = number
    memory = number
    disk_gb = number
  })
}

variable "worker_nodes" {
  type = list(object({
    vmid = number
    name = string
    ip = string
    cores = number
    memory = number
    disk_gb = number
  }))
}
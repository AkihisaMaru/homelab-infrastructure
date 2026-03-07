variable "name" { type = string }
variable "target_node" { type = string }
variable "vmid" { type = number }
variable "template_name" { type = string }

variable "full_clone" {
  type    = bool
  default = true
}

variable "cores" { type = number }
variable "memory" { type = number }
variable "disk_gb" { type = number }

variable "storage" {
  type    = string
  default = "local-lvm"
}

variable "bridge" { type = string }

variable "network_model" {
  type    = string
  default = "virtio"
}

variable "ip" { type = string }
variable "cidr" { type = number }
variable "gateway" { type = string }

variable "ciuser" {
  type    = string
  default = "ubuntu"
}

variable "ssh_public_key" { type = string }

variable "agent" {
  type    = bool
  default = true
}

variable "onboot" {
  type    = bool
  default = true
}
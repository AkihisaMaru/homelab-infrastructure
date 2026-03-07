variable "target_node" { type = string }
variable "hostname" { type = string }
variable "ostemplate" { type = string }
variable "vmid" { type = number }

variable "ssh_public_keys" { type = string }

variable "cores" {
  type    = number
  default = 2
}
variable "memory" {
  type    = number
  default = 2048
}

variable "storage" {
  type    = string
  default = "local-lvm"
}
variable "size" {
  type    = string
  default = "20G"
}

variable "bridge" { type = string }
variable "ip" { type = string }
variable "gateway" { type = string }

variable "start" {
  type    = bool
  default = true
}
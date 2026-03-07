resource "proxmox_lxc" "this" {
  target_node = var.target_node
  hostname = var.hostname
  ostemplate = var.ostemplate
  vmid = var.vmid

  ssh_public_keys = var.ssh_public_keys

  cores  = var.cores
  memory = var.memory

  rootfs {
    storage = var.storage
    size    = var.size
  }

  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.ip
    gw     = var.gateway
  }

  start = var.start
}
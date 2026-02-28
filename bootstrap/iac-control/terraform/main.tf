provider "proxmox" {
  pm_api_url          = var.pve_api_url
  pm_api_token_id     = var.pve_api_token_id
  pm_api_token_secret = var.pve_api_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_lxc" "iac-control" {
  target_node = var.target_node
  hostname    = var.hostname
  ostemplate  = var.ostemplate
  vmid = var.vmid

  ssh_public_keys = trimspace(file(var.ssh_public_key))

  cores  = 2
  memory = 2048

  rootfs {
    storage = "local-lvm"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.ip
    gw     = var.gateway
  }

  start = true
}
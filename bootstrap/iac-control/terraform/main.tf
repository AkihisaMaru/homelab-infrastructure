provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_lxc" "iac-control" {
  target_node = "pve"
  hostname    = "iac-control"
  ostemplate  = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"

  ssh_public_keys = var.root_ssh_public_key

  cores  = 2
  memory = 2048

  rootfs {
    storage = "local-lvm"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.ip_cidr
    gw     = var.gateway
  }

  start = true
}
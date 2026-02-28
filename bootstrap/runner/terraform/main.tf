provider "proxmox" {
  pm_api_url = var.pve_api_url
  pm_api_token_id = var.pve_api_token_id
  pm_api_token_secret = var.pve_api_token_secret
  pm_tls_insecure = true
}

locals {
  ssh_public_key = trimspace(file(var.ssh_public_key))
}

resource "proxmox_ve_qemu" "k3s_control_plane" {
  name = var.control_plane.name
  target_node = var.target_node
  vmid = var.control_plane.vmid

  clone = var.template_id
  full_clone = true

  cores = var.control_plane.cores
  memory = var.control_plane.memory


  disk {
    type = "scsi"
    storage = "local-lvm"
    size = "${var.control_plane.disk_gb}G"
  }

  network {
    model = "virtio"
    bridge = var.bridge
  }

  os_type = "cloud-init"

  ipconfig0 = "ip=${var.control_plane.ip}/${var.cider},gw=${var.gateway}"
  ciuser = "ubuntu"
  
  sshkeys = locals.ssh_public_key

  agent = 1
  onboot = true
}

resource "proxmox_ve_qemu" "k3s_worker_node" {
  count = length(var.worker_nodes)
  name = var.worker_nodes[count.index].name
  target_node = var.target_node
  vmid = var.worker_nodes[count.index].vmid

  clone = var.template_id
  full_clone = true

  cores = var.worker_nodes[count.index].cores
  memory = var.worker_nodes[count.index].memory

  disk {
    type = "scsi"
    storage = "local-lvm"
    size = "${var.worker_nodes[count.index].disk_gb}G"
  }

  network {
    model = "virtio"
    bridge = var.bridge
  }

  os_type = "cloud-init"

  ipconfig0 = "ip=${var.worker_nodes[count.index].ip}/${var.cidr},gw=${var.gateway}"
  ciuser = "ubuntu"
  sshkeys = locals.ssh_public_key

  agent = 1
  onboot = true
}
resource "proxmox_vm_qemu" "this" {
  name = var.name
  target_node = var.target_node
  vmid = var.vmid

  clone = var.template_name
  full_clone = var.full_clone

  cores  = var.cores
  memory = var.memory

  disk {
    slot = "scsi0"
    type = "disk"
    storage = var.storage
    size = "${var.disk_gb}G"
  }

  disk {
    slot = "ide2"
    type = "cloudinit"
    storage = var.storage
  }

  network {
    id = 0
    model  = var.network_model
    bridge = var.bridge
  }

  ipconfig0 = "ip=${var.ip}/${var.cidr},gw=${var.gateway}"
  ciuser = var.ciuser
  sshkeys = var.ssh_public_key

  agent = var.agent
  onboot = var.onboot
}
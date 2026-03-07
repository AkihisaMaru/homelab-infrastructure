module "iac_control" {
  source = "./modules/proxmox_lxc"

  target_node = "pve"
  hostname = "iac-control"
  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  vmid = 200

  ssh_public_keys = local.ssh_public_key

  cores = 2
  memory = 2048

  # rootfs
  storage = "local-lvm"
  size = "20G"

 # network
  bridge = "vnet1"
  ip = "192.168.100.20/24"
  gateway = "192.168.100.1"

  start = true
}

module "k3s_control_plane" {
  source = "./modules/proxmox_vm"

  target_node = "pve"
  name = "k3s-control-plane"
  vmid = 500

  clone = "ubuntu-2204-template"
  full_clone = true

  cores = 1
  memory = 2048

  disk {
    slot = "scsi0"
    type = "disk"
    storage = "local-lvm"
    size = "20G"
  }

  disk {
    slot = "ide2"
    type = "cloudinit"
    storage = "local-lvm"
  }

  network {
    id = 0
    model = "virtio"
    bridge = "vnet1"
  }

  ipconfig0 = "ip=192.168.100.50/24,gw=192.168.100.1"
  ciuser = "ubuntu"

  sshkeys = local.ssh_public_key

  agent = 1
  onboot = true
}

module "k3s_worker_01" {
  source = "./modules/proxmox_vm"

  target_node = "pve"
  name = "k3s-worker-01"
  vmid = 501

  clone = "ubuntu-2204-template"
  full_clone = true

  cores = 2
  memory = 4096

  disk {
    slot = "scsi0"
    type = "disk"
    storage = "local-lvm"
    size = "30G"
  }

  disk {
    slot = "ide2"
    type = "cloudinit"
    storage = "local-lvm"
  }

  network {
    id = 0
    model = "virtio"
    bridge = "vnet1"
  }

  ipconfig0 = "ip=192.168.100.51/24,gw=192.168.100.1"
  ciuser = "ubuntu"

  sshkeys = local.ssh_public_key

  agent = 1
  onboot = true
}


module "k3s_worker_02" {
  source = "./modules/proxmox_vm"

  target_node = "pve"
  name = "k3s-worker-02"
  vmid = 502

  clone = "ubuntu-2204-template"
  full_clone = true

  cores = 2
  memory = 4096

  disk {
    slot = "scsi0"
    type = "disk"
    storage = "local-lvm"
    size = "30G"
  }

  disk {
    slot = "ide2"
    type = "cloudinit"
    storage = "local-lvm"
  }

  network {
    id = 0
    model = "virtio"
    bridge = "vnet1"
  }

  ipconfig0 = "ip=192.168.100.52/24,gw=192.168.100.1"
  ciuser = "ubuntu"

  sshkeys = local.ssh_public_key

  agent = 1
  onboot = true
}
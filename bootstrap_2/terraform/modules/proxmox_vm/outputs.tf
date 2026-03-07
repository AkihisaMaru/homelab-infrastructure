output "name" {
  value = proxmox_vm_qemu.this.name
}

output "vmid" {
  value = proxmox_vm_qemu.this.vmid
}

output "ip" {
  value = proxmox_vm_qemu.this.ipconfig0
}
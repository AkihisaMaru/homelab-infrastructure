output "iac_control_hostname" {
  value = module.iac_control.hostname
}

output "iac_control_vmid" {
  value = module.iac_control.vmid
}

output "k3s_control_plane_name" {
  value = module.k3s_control_plane.name
}

output "k3s_control_plane_vmid" {
  value = module.k3s_control_plane.vmid
}

output "k3s_worker_vmids" {
  value = [
    module.k3s_worker_01.vmid,
    module.k3s_worker_02.vmid
  ]
}
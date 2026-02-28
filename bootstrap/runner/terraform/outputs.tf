output "k3s_control_plane" {
  value = var.control_plane.ip
}

output "k3s_worker_node" {
  value = [for x in var.worker_nodes : x.ip ]
}
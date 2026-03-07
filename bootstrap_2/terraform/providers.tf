provider "proxmox" {
  pm_api_url = var.pve_api_url
  pm_api_token_id = var.pve_api_token_id
  pm_api_token_secret = var.pve_api_token_secret
  pm_tls_insecure = true
}
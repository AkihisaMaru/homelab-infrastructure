# homelab-infrastructure

Infrastructure-as-code homelab built on Proxmox.

## VMID Design

|   VMIDレンジ | IPレンジ | 分類 | 例 | 備考 |
| :-: | - | - | - | - |
| 000 - 099 | `.0` - `.9` | - | - | 管理用予約 |
| 100 - 199 | `.10` - `.19` | Apps / Public | Homepage, Blog | 外部向けサービス |
| 200 - 299 | `.20` - `.29` | Platform / Ops | - | Terraform/Ansible/CI運用中枢 |
| 300 - 399 | `.30` - `.39` | Observability | Prometheus, Grafana, Loki | 監視・ログ・メトリクス |
| 400 - 499 | `.40` - `.49` | Edge / Network / Security | Nginx Proxy Manager, AdGuard Home, VPN, Auth | 入口・DNS・認証・VPN |
| 500 - 699 | `.50` - `.69` | Cluster | GitHub self-hosted runner | K3s/クラスタ系 |
| 700 - 899 | `.70` - `.89` | Sandbox | - | - |
| 900 - 999 | `.90` - `.99` | Templates | Ubuntu cloud-init template | VMテンプレ |

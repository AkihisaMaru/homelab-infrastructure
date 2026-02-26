## 1. Terraform

|変数|内容|
|:-:|:-:|
|`TF_VAR_ssh_public_key`|`XXXXX`|
|`TF_VAR_pve_api_token_secret`|`XXXXX`|

## 2. Ansible

```
$ ansible-playbook -i inventory.ini playbooks/setup_tf_apply.yml \
  --private-key ~/.ssh/iac_control_key \
  -e "runner_public_key=$(cat ~/.ssh/iac_control_key.pub)"
```
- 
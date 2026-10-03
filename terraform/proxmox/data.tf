
data "proxmox_virtual_environment_vm" "prod" {
  node_name = "linuxvm"
  vm_id     = 101
}

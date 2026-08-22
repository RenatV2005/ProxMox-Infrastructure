moved {
  from = proxmox_virtual_environment_vm.ubuntu_dev
  to   = proxmox_virtual_environment_vm.vm["dev"]
}

moved {
  from = proxmox_virtual_environment_vm.ubuntu_test
  to   = proxmox_virtual_environment_vm.vm["test"]
}

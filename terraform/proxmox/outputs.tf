output "vm_names" {
  description = "Names of all Terraform-managed VMs"

  value = {
    for key, vm in proxmox_virtual_environment_vm.vm :
    key => vm.name
  }
}

output "vm_ids" {
  description = "Proxmox VM IDs of all Terraform-managed VMs"

  value = {
    for key, vm in proxmox_virtual_environment_vm.vm :
    key => vm.vm_id
  }
}

output "vm_mac_addresses" {
  description = "MAC addresses of all Terraform-managed VMs"

  value = {
    for key, vm in proxmox_virtual_environment_vm.vm :
    key => vm.mac_addresses
  }
}
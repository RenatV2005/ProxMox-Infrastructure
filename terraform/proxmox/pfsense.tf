resource "proxmox_virtual_environment_vm" "pfSense_vm" {
  name      = "pfSense"
  node_name = "linuxvm"
  vm_id     = 100

  cpu {
    cores = 1
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 1024
  }

  scsi_hardware = "virtio-scsi-single"
}

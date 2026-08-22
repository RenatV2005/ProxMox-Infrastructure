resource "proxmox_virtual_environment_vm" "vm" {
  for_each = var.vms

  name      = each.value.name
  node_name = each.value.node_name
  vm_id     = each.value.vm_id

  on_boot       = each.value.on_boot
  scsi_hardware = each.value.scsi_hardware

  cpu {
    cores = each.value.cores
    type  = each.value.cpu_type
  }

  memory {
    dedicated = each.value.memory
  }

  dynamic "operating_system" {
    for_each = each.value.operating_system != null ? [each.value.operating_system] : []

    content {
      type = operating_system.value
    }
  }

  dynamic "clone" {
    for_each = each.value.template_id != null ? [each.value.template_id] : []

    content {
      vm_id = clone.value
    }
  }

  dynamic "initialization" {
    for_each = (
      each.value.ip != null &&
      each.value.gateway != null &&
      each.value.username != null &&
      each.value.password != null
    ) ? [1] : []

    content {
      ip_config {
        ipv4 {
          address = each.value.ip
          gateway = each.value.gateway
        }
      }

      user_account {
        username = each.value.username
        password = each.value.password

        keys = [
          var.vm_ssh_public_key
        ]
      }
    }
  }
}
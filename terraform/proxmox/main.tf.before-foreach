resource "proxmox_virtual_environment_vm" "ubuntu_dev" {
  name      = var.vm_name
  node_name = var.vm_node
  vm_id     = var.vm_id

  clone {
    vm_id = var.template_id
  }

  cpu {
    cores = var.vm_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.vm_ip
        gateway = var.vm_gateway
      }
    }

    user_account {
      username = var.vm_username
      password = var.vm_password

      keys = [
        var.vm_ssh_public_key
      ]
    }
  }
}

resource "proxmox_virtual_environment_vm" "ubuntu_test" {
  name      = var.vm_name2
  node_name = var.vm_node2
  vm_id     = var.vm_id2

  clone {
    vm_id = var.template_id2
  }

  cpu {
    cores = var.vm_cores2
  }

  memory {
    dedicated = var.vm_memory2
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.vm_ip2
        gateway = var.vm_gateway2
      }
    }

    user_account {
      username = var.vm_username2
      password = var.vm_password2

      keys = [
        var.vm_ssh_public_key
      ]
    }
  }
}
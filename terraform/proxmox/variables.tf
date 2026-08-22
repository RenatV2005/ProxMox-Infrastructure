variable "proxmox_endpoint" {
  description = "Proxmox VE API endpoint"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox VE API token"
  type        = string
  sensitive   = true
}

variable "vm_ssh_public_key" {
  description = "SSH public key for VM users"
  type        = string
}

variable "vms" {
  description = "Virtual machines managed by Terraform"

  type = map(object({
    name      = string
    vm_id     = number
    node_name = string
    cores     = number
    memory    = number

    cpu_type         = optional(string)
    on_boot          = optional(bool)
    scsi_hardware    = optional(string)
    operating_system = optional(string)

    template_id = optional(number)
    ip          = optional(string)
    gateway     = optional(string)
    username    = optional(string)
    password    = optional(string)
  }))
}
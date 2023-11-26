variable "palo_bootstrap_options" {
  description = "VM Instance metadata to configure the vmseries instances."
  type = object({
    dgname            = string
    op-command-modes  = optional(string, "mgmt-interface-swap")
    panorama-server   = string
    panorama-server-2 = optional(string, "8.8.8.8") # If null just give a google IP
    tplname           = string
    type              = optional(string, "dhcp-client")
    vm-auth-key       = string
  })
  nullable = false
}

variable "project_id" {
  description = "The project id where VMs and ILB should be deployed."
  type        = string
  nullable    = false
}

variable "region" {
  description = "The region where VMs and ILB should be deployed."
  type        = string
  nullable    = false
}

variable "ilbs" {
  description = "A configuration object for the ILBs associated with the vmseries instances."
  type = map(object({
    name         = string
    address      = string
    ports        = optional(list(string)) # Null forwards all ports
    vpc_config = object({
      network    = string
      subnetwork = string
    })
  }))
  nullable = false
}

variable "instances" {
  description = "A configuration object for the vmseries VMs."
  type = map(object({
    network_interfaces = list(object({
      network    = string
      subnetwork = string
      address    = string
    }))
    boot_disk_size        = optional(number, 100)
    boot_disk_type        = optional(string, "pd-balanced")
    image                 = optional(string, "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-byol-913")
    labels                = optional(map(string), {})
    network_tags          = optional(list(string), [])
    secure_tags           = optional(map(string), {}) # These are resource manager tags
    service_account_email = string
    vm_type               = optional(string, "n2-standard-8")
    zone                  = string
  }))
  nullable = false
}
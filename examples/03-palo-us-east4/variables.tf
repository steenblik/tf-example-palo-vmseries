variable "network_cfgs" {
  description = "Addresses and port info for each of the legs of the Palo Alto devices"
  type = map(map(object({
    instance_addresses = list(string)
    ilb_address        = optional(string)
  })))
}

variable "palo_bootstrap_options" {
  description = "VM Instance metadata to configure the vmseries instances."
  type = object({
    dgname            = string
    op-command-modes  = optional(string)
    panorama-server   = string
    panorama-server-2 = optional(string)
    tplname           = string
    type              = optional(string)
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
}

variable "subnet_self_links" {
  description = "An object containing all of the subnet self-links."
  type = object({
    hybrid           = string
    internet         = string
    management       = string
    partner          = string
    preprod-external = string
    preprod-internal = string
    prod-external    = string
    prod-internal    = string
    nonprod-internal = string
  })
  nullable = false
}

variable "vpc_self_links" {
  description = "An object containing all of the vpc self-links."
  type = object({
    hybrid           = string
    internet         = string
    management       = string
    partner          = string
    preprod-external = string
    preprod-internal = string
    prod-external    = string
    prod-internal    = string
    nonprod-internal = string
  })
}
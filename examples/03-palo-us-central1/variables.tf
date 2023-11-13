variable "health_check_port" {
  description = "The port the ILB will use to check for VM health."
  type        = string
  default     = "80"
}

variable "ilb_addresses" {
  description = "An object containing the IP addresses for the ILBs."
  type = object({
    ew = string
    ns = string
  })
  nullable = false
}

variable "instance_addresses" {
  description = "IP addresses for the 0th and 1st vmseries instances."
  type = map(object({
    hybrid           = optional(list(string))
    internet         = optional(list(string))
    management       = list(string)
    preprod-external = list(string)
    preprod-internal = list(string)
    partner          = list(string)
    prod-external    = list(string)
    prod-internal    = list(string)
    test             = list(string)
  }))
  nullable = false
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
    test             = string
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
    test             = string
  })
}
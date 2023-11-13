locals {
  # We need the interfaces to be in a specific order
  _common_nets = [
    "preprod-external",
    "preprod-internal",
    "prod-external",
    "prod-internal",
    "test",
    "partner"
  ]
  ew_iface_order = concat([
    "management",
    "hybrid",
  ], local._common_nets)
  ns_iface_order = concat([
    "management",
    "internet",
  ], local._common_nets)
}

module "east_west_vmseries" {
  source     = "../../"
  project_id = var.project_id
  region     = var.region
  ilb = {
    name    = "vmseries-ew-${var.region}"
    address = var.ilb_addresses.ew
    vpc_config = {
      network    = var.vpc_self_links.hybrid
      subnetwork = var.subnet_self_links.hybrid
    }
    health_check_port = var.health_check_port
  }
  palo_bootstrap_options = var.palo_bootstrap_options
  instances = {
    vmseries-ew-prod-0 = {
      network_interfaces = [
        for net in local.ew_iface_order : {
          network    = var.vpc_self_links[net]
          subnetwork = var.subnet_self_links[net]
          address    = var.instance_addresses.ew[net][0]
        }
      ]
      zone = "${var.region}-a"
    }
    vmseries-ew-prod-1 = {
      network_interfaces = [
        for net in local.ew_iface_order : {
          network    = var.vpc_self_links[net]
          subnetwork = var.subnet_self_links[net]
          address    = var.instance_addresses.ew[net][1]
        }
      ]
      zone = "${var.region}-b"
    }
  }
}

module "north_south_vmseries" {
  source     = "../../"
  project_id = var.project_id
  region     = var.region
  ilb = {
    name    = "vmseries-ns-${var.region}"
    address = var.ilb_addresses.ns
    vpc_config = {
      network    = var.vpc_self_links.internet
      subnetwork = var.subnet_self_links.internet
    }
    health_check_port = var.health_check_port
  }
  palo_bootstrap_options = var.palo_bootstrap_options
  instances = {
    vmseries-ns-prod-0 = {
      network_interfaces = [
        for net in local.ns_iface_order : {
          network    = var.vpc_self_links[net]
          subnetwork = var.subnet_self_links[net]
          address    = var.instance_addresses.ns[net][0]
        }
      ]
      zone = "${var.region}-a"
    }
    vmseries-ns-prod-1 = {
      network_interfaces = [
        for net in local.ns_iface_order : {
          network    = var.vpc_self_links[net]
          subnetwork = var.subnet_self_links[net]
          address    = var.instance_addresses.ns[net][1]
        }
      ]
      zone = "${var.region}-b"
    }
  }
}

locals {
  # We need the interfaces to be in a specific order
  _common_nets = [
    "preprod-external",
    "preprod-internal",
    "prod-external",
    "prod-internal",
    "nonprod-internal",
    "partner"
  ]
  iface_order = {
    ew = concat([
      "management",
      "hybrid",
    ], local._common_nets)
    ns = concat([
      "management",
      "internet",
    ], local._common_nets)
  }
  ilb_addresses = { for k, v in var.network_cfgs : k => {
    for vpc, data in v : vpc => data.ilb_address if data.ilb_address != null
  } }
  instance_addresses = { for k, v in var.network_cfgs : k => {
    for vpc, data in v : vpc => data.instance_addresses
  } }
}

// This bit could be done in the base network stage and used to populate firewall rules
module "fw_service_account" {
  source     = "../../../../../modules/iam-service-account"
  name       = "palo-fw-sa"
  project_id = var.project_id
}

module "east_west_vmseries" {
  for_each   = toset(["ew"])
  source     = "../../"
  project_id = var.project_id
  region     = var.region
  ilbs = { for vpc, addr in local.ilb_addresses[each.key] : vpc =>
    {
      name    = "vmseries-${each.key}-${var.region}-${vpc}"
      address = addr
      vpc_config = {
        network    = var.vpc_self_links[vpc]
        subnetwork = var.subnet_self_links[vpc]
      }
    }
  }
  palo_bootstrap_options = var.palo_bootstrap_options
  instances = {
    "fw-${each.key}-${var.region}-0" = {
      network_interfaces = [
        for vpc in local.iface_order[each.key] : {
          network    = var.vpc_self_links[vpc]
          subnetwork = var.subnet_self_links[vpc]
          address    = local.instance_addresses[each.key][vpc][0]
        }
      ]
      network_tags          = ["palo-fw"]
      service_account_email = module.fw_service_account.email
      zone                  = "${var.region}-a"
    }
    "fw-${each.key}-${var.region}-1" = {
      network_interfaces = [
        for vpc in local.iface_order[each.key] : {
          network    = var.vpc_self_links[vpc]
          subnetwork = var.subnet_self_links[vpc]
          address    = local.instance_addresses[each.key][vpc][1]
        }
      ]
      network_tags          = ["palo-fw"]
      service_account_email = module.fw_service_account.email
      zone                  = "${var.region}-b"
    }
  }
}

// This is seperate so that we can use different module versions
module "north_south_vmseries" {
  for_each   = toset(["ns"])
  source     = "../../"
  project_id = var.project_id
  region     = var.region
  ilbs = { for vpc, addr in local.ilb_addresses[each.key] : vpc =>
    {
      name    = "vmseries-${each.key}-${var.region}-${vpc}"
      address = addr
      vpc_config = {
        network    = var.vpc_self_links[vpc]
        subnetwork = var.subnet_self_links[vpc]
      }
      health_check = google_compute_region_health_check.check.self_link
    }
  }
  palo_bootstrap_options = var.palo_bootstrap_options
  instances = {
    "fw-${each.key}-${var.region}-0" = {
      network_interfaces = [
        for vpc in local.iface_order[each.key] : {
          network    = var.vpc_self_links[vpc]
          subnetwork = var.subnet_self_links[vpc]
          address    = local.instance_addresses[each.key][vpc][0]
        }
      ]
      network_tags          = ["palo-fw"]
      service_account_email = module.fw_service_account.email
      zone                  = "${var.region}-a"
    }
    "fw-${each.key}-${var.region}-1" = {
      network_interfaces = [
        for vpc in local.iface_order[each.key] : {
          network    = var.vpc_self_links[vpc]
          subnetwork = var.subnet_self_links[vpc]
          address    = local.instance_addresses[each.key][vpc][1]
        }
      ]
      network_tags          = ["palo-fw"]
      service_account_email = module.fw_service_account.email
      zone                  = "${var.region}-b"
    }
  }
}
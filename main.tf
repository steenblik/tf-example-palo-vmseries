module "vmseries-instances" {
  source     = "../../../modules/compute-vm"
  for_each   = var.instances
  project_id = var.project_id
  boot_disk = {
    initialize_params = {
      image = each.value.image
      size  = each.value.boot_disk_size
      type  = each.value.boot_disk_type
    }
  }
  can_ip_forward = true
  # What are these values for palos
  group         = { named_ports = { http = "80", app42 = "4242" } }
  instance_type = each.value.vm_type
  labels        = each.value.labels
  metadata = merge(
    {
      // https://docs.paloaltonetworks.com/vm-series/11-0/vm-series-deployment/bootstrap-the-vm-series-firewall/create-the-init-cfgtxt-file/init-cfgtxt-file-components#id07933d91-15be-414d-bc8d-f2a5f3d8df6b
      bootstrap_options = <<-EOF
      dgname            = ${var.palo_bootstrap_options.dgname}
      hostname          = ${each.key}
      op-command-modes  = ${var.palo_bootstrap_options.op-command-modes}
      panorama-server   = ${var.palo_bootstrap_options.panorama-server}
      panorama-server-2 = ${var.palo_bootstrap_options.panorama-server-2}
      tplname           = ${var.palo_bootstrap_options.tplname}
      type              = ${var.palo_bootstrap_options.type}
      vm-auth-key       = ${var.palo_bootstrap_options.vm-auth-key}
EOF
  })
  name = each.key
  # Do a little reshaping
  network_interfaces = [for iface in each.value.network_interfaces : merge(
    iface, { addresses = { internal = iface.address } }
  )]
  service_account = {
    email = each.value.service_account_email
  }
  tag_bindings = each.value.secure_tags
  tags         = each.value.network_tags
  zone         = each.value.zone
}

resource "google_compute_region_health_check" "this" {
  project = var.project_id
  name    = "palo-healthcheck-${var.region}"
  region  = var.region
  log_config {
    enable = true
  }
  tcp_health_check {
    port = 80
  }
}

module "vmseries-ilb" {
  source        = "../../../modules/net-lb-int"
  for_each      = var.ilbs
  project_id    = var.project_id
  region        = var.region
  name          = each.value.name
  address       = each.value.address
  global_access = true
  vpc_config = each.value.vpc_config
  backends = [for k, v in module.vmseries-instances : {
    group = module.vmseries-instances["${k}"].group.self_link
  }]

  backend_service_config = {
    session_affinity = "CLIENT_IP"
    timeout_sec      = 10
  }
  health_check = google_compute_region_health_check.this.self_link
}
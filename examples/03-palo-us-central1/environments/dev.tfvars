network_cfgs = {
  ew = {
    management = {
      instance_addresses = ["10.0.0.3", "10.0.0.4"]
    }
    hybrid = {
      ilb_address        = "10.0.4.2"
      instance_addresses = ["10.0.4.3", "10.0.4.4"]
    }
    nonprod-internal = {
      ilb_address        = "10.0.16.2"
      instance_addresses = ["10.0.16.3", "10.0.16.4"]
    }
    preprod-external = {
      ilb_address        = "10.0.14.2"
      instance_addresses = ["10.0.14.3", "10.0.14.4"]
    }
    preprod-internal = {
      ilb_address        = "10.0.8.2"
      instance_addresses = ["10.0.8.3", "10.0.8.4"]
    }
    prod-external = {
      ilb_address        = "10.0.10.2"
      instance_addresses = ["10.0.10.3", "10.0.10.4"]
    }
    prod-internal = {
      ilb_address        = "10.0.2.2"
      instance_addresses = ["10.0.2.3", "10.0.2.4"]
    }
    partner = {
      ilb_address        = "10.0.12.2"
      instance_addresses = ["10.0.12.3", "10.0.12.4"]
    }
  }
  ns = {
    management = {
      instance_addresses = ["10.0.0.6", "10.0.0.7"]
    }
    internet = {
      ilb_address        = "10.0.6.5"
      instance_addresses = ["10.0.6.6", "10.0.6.7"]
    }
    nonprod-internal = {
      ilb_address        = "10.0.16.5"
      instance_addresses = ["10.0.16.6", "10.0.16.7"]
    }
    preprod-external = {
      ilb_address        = "10.0.14.5"
      instance_addresses = ["10.0.14.6", "10.0.14.7"]
    }
    preprod-internal = {
      ilb_address        = "10.0.8.5"
      instance_addresses = ["10.0.8.6", "10.0.8.7"]
    }
    prod-external = {
      ilb_address        = "10.0.10.5"
      instance_addresses = ["10.0.14.6", "10.0.14.7"]
    }
    prod-internal = {
      ilb_address        = "10.0.2.5"
      instance_addresses = ["10.0.2.6", "10.0.2.7"]
    }
    partner = {
      ilb_address        = "10.0.12.5"
      instance_addresses = ["10.0.12.6", "10.0.12.7"]
    }
  }
}

palo_bootstrap_options = {
  dgname          = "foo"
  panorama-server = "1.2.3.4"
  tplname         = "foo"
  vm-auth-key     = "foo-key"
}

project_id = "your-project-123"

region = "us-central1"

subnet_self_links = {
  management       = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/management"
  preprod-external = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/preprod-external"
  preprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/preprod-internal"
  prod-internal    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/prod-internal"
  prod-external    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/prod-external"
  hybrid           = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/hybrid"
  partner          = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/partner"
  internet         = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/internet"
  nonprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/nonprod-internal"
}

vpc_self_links = {
  management       = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/management"
  preprod-external = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/preprod-external"
  preprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/preprod-internal"
  prod-internal    = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/prod-internal"
  prod-external    = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/prod-external"
  hybrid           = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/hybrid"
  partner          = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/partner"
  internet         = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/internet"
  nonprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/nonprod-internal"
}
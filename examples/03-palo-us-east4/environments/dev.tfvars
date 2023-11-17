network_cfgs = {
  ew = {
    management = {
      instance_addresses = ["10.0.1.3", "10.0.1.4"]
    }
    hybrid = {
      ilb_address        = "10.0.5.2"
      instance_addresses = ["10.0.5.3", "10.0.5.4"]
    }
    preprod-external = {
      ilb_address        = "10.0.15.2"
      instance_addresses = ["10.0.15.3", "10.0.15.4"]
    }
    preprod-internal = {
      ilb_address        = "10.0.9.2"
      instance_addresses = ["10.0.9.3", "10.0.9.4"]
    }
    prod-external = {
      ilb_address        = "10.0.11.2"
      instance_addresses = ["10.0.11.3", "10.0.11.4"]
    }
    prod-internal = {
      ilb_address        = "10.0.3.2"
      instance_addresses = ["10.0.3.3", "10.0.3.4"]
    }
    partner = {
      ilb_address        = "10.0.13.2"
      instance_addresses = ["10.0.13.3", "10.0.13.4"]
    }
    test-internal = {
      ilb_address        = "10.0.17.2"
      instance_addresses = ["10.0.17.3", "10.0.17.4"]
    }
  }
  ns = {
    management = {
      instance_addresses = ["10.0.1.5", "10.0.1.6"]
    }
    internet = {
      ilb_address        = "10.0.7.5"
      instance_addresses = ["10.0.7.6", "10.0.7.7"]
    }
    preprod-external = {
      ilb_address        = "10.0.15.5"
      instance_addresses = ["10.0.15.6", "10.0.15.7"]
    }
    preprod-internal = {
      ilb_address        = "10.0.9.5"
      instance_addresses = ["10.0.9.6", "10.0.9.7"]
    }
    prod-external = {
      ilb_address        = "10.0.11.5"
      instance_addresses = ["10.0.11.6", "10.0.11.7"]
    }
    prod-internal = {
      ilb_address        = "10.0.3.5"
      instance_addresses = ["10.0.3.6", "10.0.3.7"]
    }
    partner = {
      ilb_address        = "10.0.13.5"
      instance_addresses = ["10.0.13.6", "10.0.13.7"]
    }
    test-internal = {
      ilb_address        = "10.0.17.5"
      instance_addresses = ["10.0.17.6", "10.0.17.7"]
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

region = "us-east4"

subnet_self_links = {
  management       = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/management"
  preprod-external = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/preprod-external"
  preprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/preprod-internal"
  prod-internal    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/prod-internal"
  prod-external    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/prod-external"
  hybrid           = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/hybrid"
  partner          = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/partner"
  internet         = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/internet"
  nonprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/nonprod-internal"
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
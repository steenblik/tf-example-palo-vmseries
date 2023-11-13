health_check_port = "80"
ilb_addresses = {
  ew = "10.0.5.2"
  ns = "10.0.7.2"
}
instance_addresses = {
  ew = {
    hybrid           = ["10.0.5.3", "10.0.5.4"]
    management       = ["10.0.1.3", "10.0.1.4"]
    preprod-external = ["10.0.15.3", "10.0.15.4"]
    preprod-internal = ["10.0.9.3", "10.0.9.4"]
    prod-external    = ["10.0.11.3", "10.0.11.4"]
    prod-internal    = ["10.0.3.3", "10.0.3.4"]
    partner          = ["10.0.13.3", "10.0.13.4"]
    test             = ["10.0.17.3", "10.0.17.4"]
  }
  ns = {
    internet         = ["10.0.7.5", "10.0.7.6"]
    management       = ["10.0.1.5", "10.0.1.6"]
    preprod-external = ["10.0.15.5", "10.0.15.6"]
    preprod-internal = ["10.0.9.5", "10.0.9.6"]
    prod-external    = ["10.0.11.5", "10.0.11.6"]
    prod-internal    = ["10.0.3.5", "10.0.3.6"]
    partner          = ["10.0.13.5", "10.0.13.6"]
    test             = ["10.0.17.5", "10.0.17.6"]
  }
}
palo_bootstrap_options = {
  dgname          = "foo"
  panorama-server = "1.2.3.4"
  tplname         = "foo"
  vm-auth-key     = "foo-key"
}
project_id = "your-project-123"
region     = "us-east4"
subnet_self_links = {
  management       = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/management"
  preprod-external = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/preprod-external"
  preprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/preprod-internal"
  prod-internal    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/prod-internal"
  prod-external    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/prod-external"
  hybrid           = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/hybrid"
  partner          = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/partner"
  internet         = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/internet"
  test             = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-east4/subnetworks/test-internal"
}
vpc_self_links = {
  management       = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-management"
  preprod-external = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-preprodexternal"
  preprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-preprodinternal"
  prod-internal    = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-prodinternal"
  prod-external    = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-prodexternal"
  hybrid           = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-hybrid"
  partner          = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-partner"
  internet         = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-internet"
  test             = "https://www.googleapis.com/compute/v1/projects/your-project-123/global/networks/my-testinternal"
}
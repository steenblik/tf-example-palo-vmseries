health_check_port = "80"
ilb_addresses = {
  ew = "10.0.4.2"
  ns = "10.0.6.2"
}
instance_addresses = {
  ew = {
    hybrid           = ["10.0.4.3", "10.0.4.4"]
    management       = ["10.0.0.3", "10.0.0.4"]
    preprod-external = ["10.0.14.3", "10.0.14.4"]
    preprod-internal = ["10.0.8.3", "10.0.8.4"]
    prod-external    = ["10.0.10.3", "10.0.10.4"]
    prod-internal    = ["10.0.2.3", "10.0.2.4"]
    partner          = ["10.0.12.3", "10.0.12.4"]
    test             = ["10.0.16.3", "10.0.16.4"]
  }
  ns = {
    internet         = ["10.0.6.5", "10.0.6.6"]
    management       = ["10.0.0.5", "10.0.0.6"]
    preprod-external = ["10.0.14.5", "10.0.14.6"]
    preprod-internal = ["10.0.8.5", "10.0.8.6"]
    prod-external    = ["10.0.10.5", "10.0.10.6"]
    prod-internal    = ["10.0.2.5", "10.0.2.6"]
    partner          = ["10.0.12.5", "10.0.12.6"]
    test             = ["10.0.16.5", "10.0.16.6"]
  }
}
palo_bootstrap_options = {
  dgname          = "foo"
  panorama-server = "1.2.3.4"
  tplname         = "foo"
  vm-auth-key     = "foo-key"
}
project_id = "your-project-123"
region     = "us-central1"
subnet_self_links = {
  management       = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/management"
  preprod-external = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/preprod-external"
  preprod-internal = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/preprod-internal"
  prod-internal    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/prod-internal"
  prod-external    = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/prod-external"
  hybrid           = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/hybrid"
  partner          = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/partner"
  internet         = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/internet"
  test             = "https://www.googleapis.com/compute/v1/projects/your-project-123/regions/us-central1/subnetworks/test-internal"
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
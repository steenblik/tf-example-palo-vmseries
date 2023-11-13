output "vmseries_instances" {
  value     = module.vmseries-instances
  sensitive = true
}

output "vmseries_ilb" {
  value = module.vmseries-ilb
}
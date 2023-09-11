output "pool_id" {
  description = "Pool id"
  value       = module.wif.pool_id
}

output "pool_state" {
  description = "Pool state"
  value       = module.wif.pool_state
}

output "pool_name" {
  description = "Pool name"
  value       = module.wif.pool_name
}

# output "provider_id" {
#   description = "Provider id"
#   value = { for id in var.wif_providers : id.provider_id => { id = google_iam_workload_identity_pool_provider.example[id.provider_id].id
#     state = google_iam_workload_identity_pool_provider.example[id.provider_id].state
#     name = google_iam_workload_identity_pool_provider.example[id.provider_id].name }
#   }
# }


# output "service_account" {
#   description = "Service Account name"
#   value       = [for sa in var.service_accounts : google_service_account.service_account[sa.name].name]
# }

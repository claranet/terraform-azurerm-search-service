output "resource" {
  description = "Search Service resource object."
  value       = azurerm_search_service.main
  sensitive   = true
}

output "module_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}

output "id" {
  description = "The ID of the Search Service."
  value       = azurerm_search_service.main.id
}

output "name" {
  description = "The name of the Search Service."
  value       = azurerm_search_service.main.name
}

output "primary_key" {
  description = "The primary key used for Search Service administration."
  value       = azurerm_search_service.main.primary_key
}

output "secondary_key" {
  description = "The secondary key used for Search Service administration."
  value       = azurerm_search_service.main.secondary_key
}

output "query_keys" {
  description = "Query keys."
  value       = azurerm_search_service.main.query_keys
}

output "query_keys_map" {
  description = "Query keys, returned as a map with array of values."
  value       = { for e in azurerm_search_service.main.query_keys : e.name => e.key... }
}

output "url" {
  description = "URL of the Search Service."
  value       = "https://${azurerm_search_service.main.name}.search.windows.net"
}

output "identity_principal_id" {
  description = "Service principal ID for the Search Service identity."
  value       = one(azurerm_search_service.main.identity[*].principal_id)
}

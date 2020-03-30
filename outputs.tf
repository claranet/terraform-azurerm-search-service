output "search_service_id" {
  description = "The ID of the Search Service."
  value       = azurerm_search_service.search_service.id
}

output "search_service_primary_key" {
  description = "The Primary Key used for Search Service Administration."
  value       = azurerm_search_service.search_service.primary_key
}

output "search_service_secondary_key" {
  description = "The Secondary Key used for Search Service Administration."
  value       = azurerm_search_service.search_service.secondary_key
}

output "search_service_query_keys" {
  description = "A query_keys block."
  value       = azurerm_search_service.search_service.query_keys
}

output "search_service_url" {
  description = "URL of the Search Service."
  value       = "https://${local.search_name}.search.windows.net"
}

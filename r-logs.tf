module "logging" {
  source  = "claranet/diagnostic-settings/azurerm"
  version = "4.0.3"

  resource_id = azurerm_search_service.search_service.id

  logs_destinations_ids = var.logs_destinations_ids
}

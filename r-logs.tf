module "logging" {
  source  = "claranet/diagnostic-settings/azurerm"
  version = "~> 6.5.0"

  resource_id = azurerm_search_service.search_service.id

  custom_name = var.custom_diagnostic_settings_name

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories
}

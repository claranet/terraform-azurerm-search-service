module "diagnostics" {
  source  = "claranet/diagnostic-settings/azurerm"
  version = "~> 8.2.0"

  resource_id = azurerm_search_service.main.id

  custom_name = var.diagnostic_settings_custom_name

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories
}

moved {
  from = module.logging
  to   = module.diagnostics
}

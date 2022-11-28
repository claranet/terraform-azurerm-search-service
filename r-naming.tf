data "azurecaf_name" "search" {
  name          = var.stack
  resource_type = "azurerm_template_deployment"
  prefixes      = compact([var.use_caf_naming ? "search" : "", local.name_prefix])
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, var.use_caf_naming ? "" : "search"])
  use_slug      = false
  clean_input   = true
  separator     = "-"
}

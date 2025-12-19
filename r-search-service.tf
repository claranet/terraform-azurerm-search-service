resource "azurerm_search_service" "main" {
  name                = local.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  replica_count   = var.sku != "free" ? var.replica_count : null
  partition_count = var.sku != "free" ? var.partition_count : null

  public_network_access_enabled = var.public_network_access_enabled
  allowed_ips                   = var.public_network_access_enabled ? var.allowed_ips : null
  network_rule_bypass_option    = var.network_rule_bypass_option

  identity {
    type = "SystemAssigned"
  }

  dynamic "timeouts" {
    for_each = var.terraform_timeouts[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }

  semantic_search_sku = var.semantic_search_sku

  local_authentication_enabled = var.local_authentication_enabled
  authentication_failure_mode  = !var.ad_authentication_enabled || (var.ad_authentication_enabled && !var.local_authentication_enabled) ? null : var.authentication_failure_mode

  tags = merge(local.default_tags, var.extra_tags)
}

moved {
  from = azurerm_search_service.search_service
  to   = azurerm_search_service.main
}

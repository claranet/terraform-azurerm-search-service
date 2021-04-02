resource "azurerm_search_service" "search_service" {
  name                = local.search_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  replica_count       = var.replica_count
  partition_count     = var.partition_count

  allowed_ips                   = var.allowed_ips
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }

  tags = merge(local.default_tags, var.extra_tags)
}

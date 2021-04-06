resource "null_resource" "query_key" {
  for_each = toset(var.query_keys)

  provisioner "local-exec" {
    command = "az rest --method post --url https://management.azure.com${azurerm_search_service.search_service.id}/createQueryKey/${each.key}?api-version=2020-08-01"
  }

  triggers = {
    key_name    = each.key
    resource_id = azurerm_search_service.search_service.id
  }
}

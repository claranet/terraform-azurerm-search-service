resource "terraform_data" "query_keys" {
  for_each = toset(var.query_keys)

  provisioner "local-exec" {
    command = "az rest --method post --url https://management.azure.com${azurerm_search_service.main.id}/createQueryKey/${each.key}?api-version=2023-11-01"
  }

  triggers_replace = [
    each.key,
    azurerm_search_service.main.id,
  ]
}

moved {
  from = null_resource.query_key
  to   = terraform_data.query_keys
}

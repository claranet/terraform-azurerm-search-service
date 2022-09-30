# Azure Cognitive Search
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/search-service/azurerm/)

This Terraform module is designed to create an [Azure Cognitive Search](https://docs.microsoft.com/en-us/azure/search/) service.

## Limitations

Due to the lack of native Terraform implementation for managing query keys, destroy operation is not supported and 
Terraform state needs to be refreshed after any query key modification to keep it up-to-date. 

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 7.x.x       | 1.3.x             | >= 3.0          |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "logs" {
  source  = "claranet/run-common/azurerm//modules/logs"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
}

module "search_service" {
  source  = "claranet/search-service/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name

  logs_destinations_ids = [module.logs.log_analytics_workspace_id]
}
```

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.0 |
| null | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| logging | claranet/diagnostic-settings/azurerm | 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_search_service.search_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service) | resource |
| [null_resource.query_key](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_ips | List of IPs or CIDRs to allow for service access | `list(string)` | `[]` | no |
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_diagnostic\_settings\_name | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| custom\_name | Custom name for the Search Service. Should be suffixed by "-search". Generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Extra tags to set on each created resource. | `map(string)` | `{}` | no |
| location | Azure location. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources Ids for logs diagnostics destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. Empty list to disable logging. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| logs\_retention\_days | Number of days to keep logs on storage account. | `number` | `30` | no |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| partition\_count | Provides index storage and I/O for read/write operations (for example, when rebuilding or refreshing an index). | `number` | `1` | no |
| public\_network\_access\_enabled | Whether or not public network access is allowed for this resource. | `bool` | `true` | no |
| query\_keys | Names of the query keys to create | `list(string)` | `[]` | no |
| replica\_count | Instances of the search service, used primarily to load balance query operations. Each replica always hosts one copy of an index | `number` | `3` | no |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| sku | The SKU which should be used for this Search Service. Possible values are `basic`, `free`, `standard`, `standard2` and `standard3`. | `string` | `"standard"` | no |
| stack | Project stack name | `string` | n/a | yes |
| terraform\_timeouts | (Optional) Allows to specify timeouts for certain Terraform actions (create, read, update, delete) | <pre>object({<br>    create = optional(string),<br>    read   = optional(string),<br>    update = optional(string),<br>    delete = optional(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| search\_service\_id | The ID of the Search Service. |
| search\_service\_identity\_principal\_id | Service principal ID for the Search Service identity |
| search\_service\_name | The name of the Search Service. |
| search\_service\_primary\_key | The Primary Key used for Search Service Administration. |
| search\_service\_query\_keys | Query keys |
| search\_service\_query\_keys\_map | Query keys, returned as a map with array of values. |
| search\_service\_secondary\_key | The Secondary Key used for Search Service Administration. |
| search\_service\_url | URL of the Search Service. |
<!-- END_TF_DOCS -->
## Related documentation

Azure Cognitive Search service: [docs.microsoft.com/en-us/azure/search/](https://docs.microsoft.com/en-us/azure/search/)

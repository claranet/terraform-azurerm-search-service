# Azure Cognitive Search
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/search-service/azurerm/)

This Terraform module is designed to create an [Azure Cognitive Search](https://docs.microsoft.com/en-us/azure/search/) service.

## Limitations

Due to the lack of native Terraform implementation for managing query keys, destroy operation is not supported and 
Terraform state needs to be refreshed after any query key modification to keep it up-to-date. 

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "search-service" {
  source  = "claranet/search-service/azurerm"
  version = "x.x.x"

  resource_group_name = module.rg.resource_group_name
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack

  logs_destinations_ids = [module.run-common.log_analytics_workspace_id]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_ips | List of IPs or CIDRs to allow for service access | `list(string)` | `[]` | no |
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_name | Custom name for the Search Service. Should be suffixed by "-search". Generated if not set. | `string` | `""` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Extra tags to set on each created resource. | `map(string)` | `{}` | no |
| location | Azure location. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. | `list(string)` | n/a | yes |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| partition\_count | Provides index storage and I/O for read/write operations (for example, when rebuilding or refreshing an index). | `number` | `1` | no |
| public\_network\_access\_enabled | Whether or not public network access is allowed for this resource. | `bool` | `true` | no |
| query\_keys | Names of the query keys to create | `list(string)` | `[]` | no |
| replica\_count | Instances of the search service, used primarily to load balance query operations. Each replica always hosts one copy of an index | `number` | `3` | no |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| sku | The SKU which should be used for this Search Service. Possible values are `basic`, `free`, `standard`, `standard2` and `standard3`. | `string` | `"standard"` | no |
| stack | Project stack name | `string` | n/a | yes |

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

## Related documentation

Azure Cognitive Search service: [docs.microsoft.com/en-us/azure/search/](https://docs.microsoft.com/en-us/azure/search/)

Terraform resource: [registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service)

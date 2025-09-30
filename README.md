# Azure Cognitive Search

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/search-service/azurerm/)

This Terraform module is designed to create an [Azure Cognitive Search](https://docs.microsoft.com/en-us/azure/search/) service.

## Limitations

Due to the lack of native Terraform implementation for managing query keys, destroy operation is not supported and
Terraform state needs to be refreshed after any query key modification to keep it up-to-date.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "search_service" {
  source  = "claranet/search-service/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name

  logs_destinations_ids = [module.logs.id]
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | >= 1.2.28 |
| azurerm | ~> 4.31 |
| terraform | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_search_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service) | resource |
| [terraform_data.query_keys](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [azurecaf_name.search](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ad\_authentication\_enabled | Whether Azure Active Directory authentication is enabled. | `bool` | `false` | no |
| allowed\_ips | List of IPs or CIDRs to allow for service access. | `list(string)` | `null` | no |
| authentication\_failure\_mode | Specifies the response that the Search Service should return for requests that fail authentication (possible values are `null`, `http401WithBearerChallenge` or `http403`) | `string` | `"http401WithBearerChallenge"` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_name | Custom name for the Search Service. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be `default` if not set. | `string` | `"default"` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Extra tags to set on each created resource. | `map(string)` | `{}` | no |
| local\_authentication\_enabled | Whether API key authentication is enabled. | `bool` | `true` | no |
| location | Azure location. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| partition\_count | Provides index storage and I/O for read/write operations (for example, when rebuilding or refreshing an index). | `number` | `1` | no |
| public\_network\_access\_enabled | Whether or not public network access is allowed for this resource. | `bool` | `true` | no |
| query\_keys | Names of the query keys to create. | `list(string)` | `[]` | no |
| replica\_count | Instances of the Search Service, used primarily to load balance query operations. Each replica always hosts one copy of an index. | `number` | `3` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| semantic\_search\_sku | Specifies the Semantic Search SKU which should be used for this Search Service. | `string` | `null` | no |
| sku | The SKU which should be used for this Search Service. Possible values are `basic`, `free`, `standard`, `standard2`, `standard3`, `storage_optimized_l1` and `storage_optimized_l2`. Changing this forces a new resource to be created. | `string` | `"standard"` | no |
| stack | Project stack name. | `string` | n/a | yes |
| terraform\_timeouts | (Optional) Allows to specify timeouts for certain Terraform actions (create, read, update, delete). | <pre>object({<br/>    create = optional(string)<br/>    read   = optional(string)<br/>    update = optional(string)<br/>    delete = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Search Service. |
| identity\_principal\_id | Service principal ID for the Search Service identity. |
| module\_diagnostics | Diagnostics settings module outputs. |
| name | The name of the Search Service. |
| primary\_key | The primary key used for Search Service administration. |
| query\_keys | Query keys. |
| query\_keys\_map | Query keys, returned as a map with array of values. |
| resource | Search Service resource object. |
| secondary\_key | The secondary key used for Search Service administration. |
| url | URL of the Search Service. |
<!-- END_TF_DOCS -->

## Related documentation

Azure Cognitive Search service: [docs.microsoft.com/en-us/azure/search/](https://docs.microsoft.com/en-us/azure/search/)

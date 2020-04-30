variable "location" {
  description = "Azure location."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "custom_name" {
  description = "Custom name for the Search Service. Should be suffixed by \"-search\". Generated if not set."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "extra_tags" {
  description = "Extra tags to set on each created resource."
  type        = map(string)
  default     = {}
}

variable "sku" {
  type        = string
  default     = "standard"
  description = "The SKU which should be used for this Search Service. Possible values are `basic`, `free`, `standard`, `standard2` and `standard3`."
}

variable "replica_count" {
  type        = number
  default     = 3 # 3 or more replicas for high availability of read-write workloads (queries and indexing)
  description = "Instances of the search service, used primarily to load balance query operations. Each replica always hosts one copy of an index"
}

variable "partition_count" {
  type        = number
  default     = 1
  description = "Provides index storage and I/O for read/write operations (for example, when rebuilding or refreshing an index)."
}

#-------------
# LOGGING
variable "enable_logging" {
  description = "Boolean flag to specify whether logging is enabled"
  type        = bool
  default     = true
}

variable "diag_settings_name" {
  description = "Custom name for the diagnostic settings of Application Gateway."
  type        = string
  default     = ""
}

variable "logs_enable_metrics" {
  description = "Boolean flag to specify whether collecting metrics is enabled"
  type        = bool
  default     = false
}

variable "logs_storage_retention" {
  description = "Retention in days for logs on Storage Account"
  type        = number
  default     = 30
}

variable "logs_storage_account_id" {
  description = "Storage Account id for logs"
  type        = string
  default     = null
}

variable "logs_log_analytics_workspace_id" {
  description = "Log Analytics Workspace id for logs"
  type        = string
  default     = null
}

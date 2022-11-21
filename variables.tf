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

variable "allowed_ips" {
  type        = list(string)
  description = "List of IPs or CIDRs to allow for service access"
  default     = []
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this resource."
  default     = true
}

variable "query_keys" {
  description = "Names of the query keys to create"
  type        = list(string)
  default     = []
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "sku" {
  description = "The SKU which should be used for this Search Service. Possible values are `basic`, `free`, `standard`, `standard2`, `standard3`, `storage_optimized_l1` and `storage_optimized_l2`. Changing this forces a new resource to be created."
  type        = string
  default     = "standard"
  nullable    = false
}

variable "replica_count" {
  type        = number
  default     = 3 # 3 or more replicas for high availability of read-write workloads (queries and indexing)
  description = "Instances of the Search Service, used primarily to load balance query operations. Each replica always hosts one copy of an index."
}

variable "partition_count" {
  type        = number
  default     = 1
  description = "Provides index storage and I/O for read/write operations (for example, when rebuilding or refreshing an index)."
}

variable "semantic_search_sku" {
  type        = string
  default     = null
  description = "Specifies the Semantic Search SKU which should be used for this Search Service."
}

variable "allowed_ips" {
  type        = list(string)
  description = "List of IPs or CIDRs to allow for service access."
  default     = null
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this resource."
  default     = true
}

variable "query_keys" {
  description = "Names of the query keys to create."
  type        = list(string)
  default     = []
}

variable "authentication_failure_mode" {
  description = "Specifies the response that the Search Service should return for requests that fail authentication (possible values are `null`, `http401WithBearerChallenge` or `http403`)"
  type        = string
  default     = "http401WithBearerChallenge"

  validation {
    condition     = var.authentication_failure_mode == null || contains(["http401WithBearerChallenge", "http403"], try(var.authentication_failure_mode, ""))
    error_message = "`authentication_failure_mode` variable must be either `null`, `http401WithBearerChallenge` or `http403`."
  }
}

variable "ad_authentication_enabled" {
  description = "Whether Azure Active Directory authentication is enabled."
  type        = bool
  default     = false
  nullable    = false
}

variable "local_authentication_enabled" {
  description = "Whether API key authentication is enabled."
  type        = bool
  default     = true
  nullable    = false
}

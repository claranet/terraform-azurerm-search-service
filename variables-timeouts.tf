
variable "terraform_timeouts" {
  description = "(Optional) Allows to specify timeouts for certain Terraform actions (create, read, update, delete)"
  type = object({
    create = optional(string),
    read   = optional(string),
    update = optional(string),
    delete = optional(string)
  })

  default = null
}

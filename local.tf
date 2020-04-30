locals {

  name_prefix  = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0") : ""
  default_name = join("-", compact([local.name_prefix, var.stack, var.client_name, var.location_short, var.environment]))

  search_name = coalesce(
    var.custom_name,
    join("-", [local.default_name, "search"])
  )

  diag_settings_name = coalesce(
    var.diag_settings_name,
    join("-", [local.default_name, "diag-settings"]),
  )

  default_tags = {
    env   = var.environment
    stack = var.stack
  }

}

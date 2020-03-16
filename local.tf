locals {
  default_tags = {
    env   = var.environment
    stack = var.stack
  }

  search_name = coalesce(
    var.custom_name,
    join("-", [var.stack, var.client_name, var.location_short, var.environment, "search"])
  )
}

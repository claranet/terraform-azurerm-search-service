# v7.2.0 - 2023-10-13

Added
  * AZ-1170: Add `authentication_failure_mode`, `ad_authentication_enabled` and `local_authentication_enabled` variables

# v7.1.0 - 2022-11-28

Breaking
  * AZ-908: Implement Azure CAF naming (using Microsoft provider)

Changed
  * AZ-908: Bump `diagnostics-settings`

# v7.0.0 - 2022-09-30

Breaking
  * AZ-840: Update to Terraform `v1.3`

# v4.4.0 - 2022-09-02

Added
  * AZ-802: Add timeouts option

# v4.3.0 - 2022-03-18

Added
  * AZ-615: Add an option to enable or disable default tags

Changed
  * AZ-589: Bump `diagnostics` module to latest `v5.0.0`

Fixed
  * AZ-589: Avoid plan drift when specifying Diagnostic Settings categories

# v4.2.1 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.2.0 - 2021-04-15

Added
  * AZ-477: Query keys creation

# v4.1.0 - 2021-04-02

Added
  * AZ-476: Assign a system identity
  * AZ-476: IP whitelisting

# v2.1.1/v3.1.1/v4.0.0 - 2020-12-14

Updated
  * AZ-273: Module now compatible terraform `v0.13+`

# v2.1.0/v3.1.0 - 2020-12-11

Added
  * AZ-225: Azure Search - Add Diagnostics

# v2.0.0/v3.0.0 - 2020-03-30

Added
  * AZ-163: Azure Search - First Release

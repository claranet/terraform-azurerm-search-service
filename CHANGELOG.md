## 7.3.0 (2024-07-22)


### Features

* add semantic_search_sku 109e7b4


### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] 8106fc9
* **AZ-1391:** update semantic-release config [skip ci] 42a611d


### Miscellaneous Chores

* **deps:** add renovate.json 0c8f3aa
* **deps:** enable automerge on renovate 7294585
* **deps:** update dependency opentofu to v1.7.0 f1f16f7
* **deps:** update dependency opentofu to v1.7.1 f654884
* **deps:** update dependency opentofu to v1.7.2 277b085
* **deps:** update dependency opentofu to v1.7.3 8e8982d
* **deps:** update dependency pre-commit to v3.7.1 6e9459d
* **deps:** update dependency terraform-docs to v0.18.0 18a4307
* **deps:** update dependency tflint to v0.51.0 e73bf7f
* **deps:** update dependency tflint to v0.51.1 f5a7ac7
* **deps:** update dependency tflint to v0.51.2 f7d4874
* **deps:** update dependency tflint to v0.52.0 d68cb54
* **deps:** update dependency trivy to v0.50.2 3fd16ba
* **deps:** update dependency trivy to v0.50.4 b76545a
* **deps:** update dependency trivy to v0.51.0 a115378
* **deps:** update dependency trivy to v0.51.1 6ad0fd0
* **deps:** update dependency trivy to v0.51.2 7c3c243
* **deps:** update dependency trivy to v0.51.4 f5ce1b6
* **deps:** update dependency trivy to v0.52.0 3948f8e
* **deps:** update dependency trivy to v0.52.1 8fa0f80
* **deps:** update dependency trivy to v0.52.2 ef114e0
* **deps:** update dependency trivy to v0.53.0 c339e96
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 d525d6f
* **deps:** update renovate.json f31b572
* **deps:** update terraform claranet/diagnostic-settings/azurerm to ~> 6.5.0 c1f834c
* **pre-commit:** update commitlint hook c146e57
* **release:** remove legacy `VERSION` file 583506b

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

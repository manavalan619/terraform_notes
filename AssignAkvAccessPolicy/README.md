# Module AssignAkvAccessPolicy

## Description
This module creates an Azure Key Vault Access Policy

## Usage
### Module Definitions

- module location : providers/azure/AssignAkvAccessPolicy

```hcl
  module "role" {
  source               = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AssignAkvAccessPolicy/"
  aad_group_list       = var.aad_group_list
  role_scope_ids       = var.role_scope_ids
  role_definition_name = var.role_definition_name
  resource_depends_on  = var.resource_depends_on
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```hcl
variable "aad_group_list" {
  type        = list(string)
  description = ""
  default     = []
}
variable "role_scope_ids" {
  type        = list(string)
  description = ""
  default     = []
}
variable "role_definition_name" {
  type        = string
  description = ""
  default     = ""
}
variable "resource_depends_on" {
  type    = any
  default = null
}
```


## Outputs
There is no variable defined as module outputs 



## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    role_definition_name = "Contributor"
    aad_group_list       = ["ZG-AZR-TG-PATTERN1-TECHLEAD", "ZG-AZR-TG-PATTERN1-DEVELOPER", "ZG-AZR-TG-PATTERN1-TMA"]

    ```

* example for `p` environment :
    ```hcl
    role_definition_name = "Reader"
    aad_group_list       = ["ZG-AZR-TG-PATTERN1-TECHLEAD", "ZG-AZR-TG-PATTERN1-TMA"]
    ```

## Example variables values in global.tfvars file
    ```hcl
    role_definition_name = "Reader"
    ```
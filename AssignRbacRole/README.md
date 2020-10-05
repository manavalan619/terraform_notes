# Module AssignRbacRole

## Description
This module creates a Role Assigment on a target resource

## Usage
### Module Definitions

- module location : providers/azure/AssignRbacRole

```hcl
module "databricks-role" {
  source               = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AssignRbacRole?ref=v1.0.0"
  aad_group_list       = var.aad_group_project_profil_resource_aad_group_list
  role_scope_ids       = module.databricks.adb_id
  role_definition_name = var.aad_group_project_profil_resource_role_definition_name
}
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```hcl
variable "aad_group_project_profil_resource_role_definition_name" {
  type = string
}
variable "aad_group_project_profil_akv_access_policy_role_definition_name" {
  type = string
}
variable "aad_group_project_profil_resource_aad_group_list" {
  type = list(string)
}
variable "aad_group_project_profil_akv_access_policy_aad_group_list" {
  type = list(string)
}
```

## Outputs
There is no variable defined as module outputs 

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    aad_group_project_profil_resource_role_definition_name          = "Contributor"
    aad_group_project_profil_akv_access_policy_role_definition_name = "Contributor"
    aad_group_project_profil_resource_aad_group_list                = ["ZG-AZR-TG-PATTERN1-TECHLEAD", "ZG-AZR-TG-PATTERN1-DEVELOPER", "ZG-AZR-TG-PATTERN1-TMA"]
    aad_group_project_profil_akv_access_policy_aad_group_list       = ["ZG-AZR-TG-PATTERN1-TECHLEAD", "ZG-AZR-TG-PATTERN1-DEVELOPER", "ZG-AZR-TG-PATTERN1-TMA"]
    ```
* example for `p` environment :
    ```hcl
    aad_group_project_profil_resource_role_definition_name          = "Reader"
    aad_group_project_profil_akv_access_policy_role_definition_name = "Reader"
    aad_group_project_profil_resource_aad_group_list                = []
    aad_group_project_profil_akv_access_policy_aad_group_list       = ["ZG-AZR-TG-PATTERN1-TECHLEAD", "ZG-AZR-TG-PATTERN1-TMA"]
    ```
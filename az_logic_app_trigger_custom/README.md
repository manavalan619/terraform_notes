# Manages a Logic App Trigger Custom


---

## Resource Type used (Terraform)

| Resource Type                      | Description                                          |
|------------------------------------|------------------------------------------------------|
| `azurerm_logic_app_trigger_custom` | Manages a Custom Trigger within a Logic App Workflow |


# Logic App Trigger Custom naming convention

Naming Syntax use the following rules :

- [x] Lower characters
- [x] Fixed size

## Logic App Trigger Custom Construction

| Type           | Char(s) length | Allowed values            | Description                                                                                    |
|----------------|----------------|---------------------------|------------------------------------------------------------------------------------------------|
| `cloud_prefix` | _2 char_       | [ az ]                    | Allowed cloud prefix / fixed with l_cloud_code in main.tf                                      |
| `type`         | _4 char_       | [ latc ]                  | Logic App Trigger Custom defined with l_resource_code                                          |
| `environment`  | _1 char_       | [ p / q / d / r / i / s ] | (**_p_**)rod, (**_q_**)ual, (**_d_**)ev, p(**_r_**)eprod, (**_i_**)ntegration, (**_s_**)andbox |
| `code`         | _4 char_       | [ <App_code> ]            | Application code                                                                               |
| `index`        | _2 char_       | [ xx ]                    | Index number for container                                                                     |

Logic App Trigger Custom Name construction :

> _[cloud_prefix]-[Type]-[environment]-[code]-[index]_

Example :

> _az-latc-p-jmpa-01_

## Tags list

Tags will be used for Financial reporting and application lifecycle
For relation with other referential (CMDB), key value is Application name
All Tags are set to all resources. Some tags are also set at resource group level

| Tag name           | Environment(s)    | Description                                                                                                                                  |
|--------------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| `Application name` | _All environment_ | Key value between Azure and CMDB.                                                                                                            |
| `Application code` | _All environment_ | Key value representing the Application name with 4 characters according to the CMDB.                                                         |
| `Branch`           | _All environment_ | TOTAL Business Branch ( MS / EP / RC / GP / HD / TS )                                                                                        |
| `Environment`      | _All environment_ | Single character (**_P_**)roduction / (**_Q_**)ualification / (**_D_**)evelopment / p(**_R_**)e-prod / (**_I_**)ntegration / (**_S_**)andbox |
| `Exploitation`     | _All environment_ | Name of outsourcer (_"BOOST"_)                                                                                                               |
| `Security Level`   | _All environment_ | Standard, High, Conditional                                                                                                                  |

# How to use Logic App Trigger Custom module

Module declaration :

```json
module "alaac" {
  source              = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_logic_app_trigger_custom?ref=master"
  providers           = { azurerm = azurerm.xx }
  providers           = { azurerm = azurerm.xx }
  assie_rgName        = var.assie_rgName
  assie_rgTags        = var.assie_rgTags
  alaw_name           = var.alaw_name
  module_alatcBody    = var.module_alatcBody
  module_alatcIndex   = var.module_alatcIndex
  resource_depends_on = var.resource_depends_on
  module_create       = var.module_create
}
```

## Mandatory Inputs

| Input name         | Input type | Description                                                                                                                          |
|--------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------|
| `module_create`    | _boolean_  | Does the resource need to be created? Possible values are true and false.                                                            |
| `assie_rgTags`     | _map_      | Tags from the Resource Group.                                                                                                        |
| `assie_rgName`     | _string_   | The name of the Resource Group in which the Logic App Workflow should be created. Changing this forces a new resource to be created. |
| `alaw_name`        | _string_   | Specifies the name of the Logic App Workflow.                                                                                        |
| `module_alatcBody` | _string_   | Specifies the JSON Blob defining the Body of this Custom Trigger.                                                                    |


## Optional Inputs

| Input name          | Input type | Description                               |
|---------------------|------------|-------------------------------------------|
| `module_alatcIndex` | _string_   | Module Index for Logic App Trigger Custom |
# Using the Output variables

## General Output variables

| Output name               | Output type | Description                                           |
|---------------------------|-------------|-------------------------------------------------------|
| `module.alatc.alatc_id`   | _string_    | The ID of the Trigger within the Logic App Workflow   |
| `module.alatc.alatc_name` | _string_    | The Name of the Trigger within the Logic App Workflow |

# Additionnal documentations

No additional doc required

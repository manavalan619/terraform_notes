# Manages a Logic App Action Http


---

## Resource Type used (Terraform)

| Resource Type                   | Description                                        |
|---------------------------------|----------------------------------------------------|
| `azurerm_logic_app_action_http` | Manages an HTTP Action within a Logic App Workflow |


# Logic App Action Http naming convention

Naming Syntax use the following rules :

- [x] Lower characters
- [x] Fixed size

## Logic App Action Http Construction

| Type           | Char(s) length | Allowed values            | Description                                                                                    |
|----------------|----------------|---------------------------|------------------------------------------------------------------------------------------------|
| `cloud_prefix` | _2 char_       | [ az ]                    | Allowed cloud prefix / fixed with l_cloud_code in main.tf                                      |
| `type`         | _4 char_       | [ laah ]                  | Logic App Action Http defined with l_resource_code                                             |
| `environment`  | _1 char_       | [ p / q / d / r / i / s ] | (**_p_**)rod, (**_q_**)ual, (**_d_**)ev, p(**_r_**)eprod, (**_i_**)ntegration, (**_s_**)andbox |
| `code`         | _4 char_       | [ <App_code> ]            | Application code                                                                               |
| `index`        | _2 char_       | [ xx ]                    | Index number for container                                                                     |

Logic App Action Http Name construction :

> _[cloud_prefix]-[Type]-[environment]-[code]-[index]_

Example :

> _az-laah-p-jmpa-01_

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

# How to use Logic App Action Http module

Module declaration :

```json
module "alaac" {
  source             = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_logic_app_action_http?ref=master"
  providers          = { azurerm = azurerm.xx }
  assie_rgName       = var.assie_rgName
  assie_rgTags       = var.assie_rgTags
  alaw_name          = var.alaw_name
  module_create      = var.module_create
  module_laahIndex   = var.module_laahIndex
  module_laahMethod  = var.module_laahMethod
  module_laahUri     = var.module_laahUri
  module_laahHeaders = var.module_laahHeaders
  module_laahBody    = var.module_laahBody
}
```

## Mandatory Inputs

| Input name          | Input type | Description                                                                                                                          |
|---------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------|
| `module_create`     | _boolean_  | Does the resource need to be created? Possible values are true and false.                                                            |
| `assie_rgTags`      | _map_      | Tags from the Resource Group.                                                                                                        |
| `assie_rgName`      | _string_   | The name of the Resource Group in which the Logic App Workflow should be created. Changing this forces a new resource to be created. |
| `alaw_name`         | _string_   | Specifies the name of the Logic App Workflow.                                                                                        |
| `module_laahMethod` | _string_   | Specifies the HTTP Method which should be used for this HTTP Action. Possible values include DELETE, GET, PATCH, POST and PUT.       |
| `module_laahUri`    | _string_   | Specifies the URI which will be called when this HTTP Action is triggered.                                                           |


## Optional Inputs

| Input name           | Input type | Description                                                                                           |
|----------------------|------------|-------------------------------------------------------------------------------------------------------|
| `module_laahIndex`   | _string_   | Module Index for Logic App Action Http.                                                               |
| `module_laahBody`    | _string_   | Specifies the HTTP Body that should be sent to the uri when this HTTP Action is triggered.            |
| `module_laahHeaders` | _string_   | Specifies a Map of Key-Value Pairs that should be sent to the uri when this HTTP Action is triggered. |

# Using the Output variables

## General Output variables

| Output name           | Output type | Description                                              |
|-----------------------|-------------|----------------------------------------------------------|
| `module.laah.laah_id` | _string_    | The ID of the HTTP Action within the Logic App Workflow. |

# Additionnal documentations

No additional doc required

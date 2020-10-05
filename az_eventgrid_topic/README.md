# Manages a EventGrid Topic


---

## Resource Type used (Terraform)

| Resource Type             | Description                |
|---------------------------|----------------------------|
| `azurerm_eventgrid_topic` | Manages an EventGrid Topic |

 |

# EventGrid Topic Naming Convention

Naming Syntax use the following rules :

- [x] Lower characters
- [x] Fixed size

## EventGrid Topic Construction

| Type           | Char(s) length | Allowed values            | Description                                                                                    |
|----------------|----------------|---------------------------|------------------------------------------------------------------------------------------------|
| `cloud_prefix` | _2 char_       | [ az ]                    | Allowed cloud prefix / fixed with l_cloud_code in main.tf                                      |
| `type`         | _3 char_       | [ egt ]                   | EventGrid Topic defined with l_resource_code                                                   |
| `environment`  | _1 char_       | [ p / q / d / r / i / s ] | (**_p_**)rod, (**_q_**)ual, (**_d_**)ev, p(**_r_**)eprod, (**_i_**)ntegration, (**_s_**)andbox |
| `code`         | _4 char_       | [ <App_code> ]            | Application code                                                                               |
| `index`        | _2 char_       | [ xx ]                    | Index number for container                                                                     |

EventGrid Topic Name construction :

> _[cloud_prefix]-[Type]-[environment]-[code]-[index]_

Example :

> _az-egt-p-jmpa-01_

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

# How to use EventGrid Topic module

Module declaration :

```json
module "apgvnr" {
  source           = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_eventgrid_topic?ref=master"
  providers        = { azurerm = azurerm.xx }
  assie_rgName     = var.assie_rgName
  assie_rgLocation = var.assie_rgLocation
  assie_rgTags     = var.assie_rgTags
  module_aegtIndex = var.module_aegtIndex
  module_create    = var.module_create
}
```

## Mandatory Inputs

| Input name              | Input type | Description                                                                                                                                       |
|-------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| `module_create`         | _boolean_  | Does the resource need to be created? Possible values are true and false.                                                                         |
| `assie_rgTags`          | _map_      | Tags from the Resource Group.                                                                                                                     |
| `assie_rgName`          | _string_   | The name of the resource group in which the EventGrid Topic exists. Changing this forces a new resource to be created.                            |
| `assie_rgLocation`      | _string_   | The location/region where the eventGrid topic will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions |
| `apgs_name`             | _string_   | Specifies the name of the PostgreSQL Server.                                                                                                      |
| `module_apgvnrSubnetId` | _string_   | The ID of the subnet that the PostgreSQL server will be connected to.                                                                             |


## Optional Inputs

| Input name         | Input type | Description                                  |
|--------------------|------------|----------------------------------------------|
| `module_aegtIndex` | _string_   | PostgreSQL Virtual Network Rule Index Number |

# Using the Output variables

## General Output variables

| Output name                             | Output type | Description                                                         |
|-----------------------------------------|-------------|---------------------------------------------------------------------|
| `module.aegt.aegt_name`                 | _string_    | The EventGrid Topic Name                                            |
| `module.aegt.aegt_id`                   | _string_    | The EventGrid Topic ID                                              |
| `module.aegt.aegt_primary_access_key`   | _string_    | The Primary Shared Access Key associated with the EventGrid Topic   |
| `module.aegt.aegt_secondary_access_key` | _string_    | The Secondary Shared Access Key associated with the EventGrid Topic |
| `module.aegt.aegt_endpoint`             | _string_    | The Endpoint associated with the EventGrid Topic                    |


# Additionnal documentations

No additional doc required

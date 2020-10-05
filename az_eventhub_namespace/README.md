# Manages a Eventhub Namespace.


---

## Resource Type used (Terraform)

| Resource Type                | Description                       |
|------------------------------|-----------------------------------|
| `azurerm_eventhub_namespace` | to manages an eventhub namespace. |

# Eventhub Namespace Naming Convention

Naming Syntax use the following rules :

- [x] Lower characters
- [x] Fixed size

## Eventhub Namespace Construction

| Type           | Char(s) length | Allowed values            | Description                                                                                    |
|----------------|----------------|---------------------------|------------------------------------------------------------------------------------------------|
| `cloud_prefix` | _2 char_       | [ az ]                    | Allowed cloud prefix / fixed with l_cloud_code in main.tf                                      |
| `type`         | _3 char_       | [ ehn ]                   | Eventhub Namespace defined with l_resource_code                                                |
| `environment`  | _1 char_       | [ p / q / d / r / i / s ] | (**_p_**)rod, (**_q_**)ual, (**_d_**)ev, p(**_r_**)eprod, (**_i_**)ntegration, (**_s_**)andbox |
| `code`         | _4 char_       | [ <App_code> ]            | Application code                                                                               |
| `index`        | _2 char_       | [ xx ]                    | Index number for container                                                                     |

Eventhub Namespace Name Construction :

> _[cloud_prefix]-[Type]-[environment]-[code]-[index]_

Example :

> _az-ehn-p-jmpa-01_

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

# How to use Eventhub Namespace module

Module declaration :

```json
module "aehn" {
  source                            = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_eventhub_namespace?ref=master"
  providers                         = { azurerm = azurerm.xx }
  assie_rgName                      = var.assie_rgName
  assie_rgTags                      = var.assie_rgTags
  assie_rgLocation                  = var.assie_rgLocation
  module_aehnIndex                  = var.module_aehnIndex
  module_aehnSku                    = var.module_aehnSku
  module_aehnCapacity               = var.module_aehnCapacity
  module_aehnAutoInflateEnabled     = var.module_aehnAutoInflateEnabled
  module_aehnMaximumThroughputUnits = var.module_aehnMaximumThroughputUnits
  module_create                     = var.module_create
}
```

## Mandatory Inputs

| Input name         | Input type | Description                                                                                                          |
|--------------------|------------|----------------------------------------------------------------------------------------------------------------------|
| `module_create`    | _boolean_  | Does the resource need to be created? Possible values are true and false.                                            |
| `assie_rgTags`     | _map_      | A mapping of tags to assign to the resource.                                                                         |
| `assie_rgName`     | _string_   | The name of the resource group in which to create the namespace. Changing this forces a new resource to be created.  |
| `assie_rgLocation` | _string_   | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. |
| `module_aehnSku`   | _string_   | Defines which tier to use. Valid options are Basic and Standard.                                                     |
## Optional Inputs

| Input name                          | Input type | Description                                                                                                    |
|-------------------------------------|------------|----------------------------------------------------------------------------------------------------------------|
| `module_aehnIndex`                  | _string_   | Resource index for the event hub namespace.                                                                    |
| `module_aehnCapacity`               | _number_   | Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20.        |
| `module_aehnAutoInflateEnabled`     | _boolean_  | Is Auto Inflate enabled for the EventHub Namespace?                                                            |
| `module_aehnMaximumThroughputUnits` | _number_   | Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20. |

# Using the Output variables

## General Output variables

| Output name                                            | Output type | Description                                                                           |
|--------------------------------------------------------|-------------|---------------------------------------------------------------------------------------|
| `module.aehn.aehn_id`                                  | _string_    | Event Hub Namespace ID.                                                               |
| `module.aehn.aehn_name`                                | _string_    | Event Hub Namespace Name.                                                             |
| `module.aehn.aehn_default_primary_connection_string`   | _string_    | The primary connection string for the authorization rule RootManageSharedAccessKey.   |
| `module.aehn.aehn_default_secondary_connection_string` | _string_    | The secondary connection string for the authorization rule RootManageSharedAccessKey. |
| `module.aehn.aehn_default_primary_key`                 | _string_    | The primary access key for the authorization rule RootManageSharedAccessKey           |
| `module.aehn.aehn_default_secondary_key`               | _string_    | The secondary access key for the authorization rule RootManageSharedAccessKey.        |

# Additionnal documentations

No additional doc required
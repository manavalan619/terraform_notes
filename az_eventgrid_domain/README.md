# Manages a EventGrid Domain


---

## Resource Type used (Terraform)

| Resource Type             | Description                 |
|---------------------------|-----------------------------|
| `azurerm_eventgrid_topic` | Manages an EventGrid Domain |


# EventGrid Domain Naming Convention

Naming Syntax use the following rules :

- [x] Lower characters
- [x] Fixed size

## EventGrid Domain Construction

| Type           | Char(s) length | Allowed values            | Description                                                                                    |
|----------------|----------------|---------------------------|------------------------------------------------------------------------------------------------|
| `cloud_prefix` | _2 char_       | [ az ]                    | Allowed cloud prefix / fixed with l_cloud_code in main.tf                                      |
| `type`         | _3 char_       | [ egd ]                   | EventGrid Topic defined with l_resource_code                                                   |
| `environment`  | _1 char_       | [ p / q / d / r / i / s ] | (**_p_**)rod, (**_q_**)ual, (**_d_**)ev, p(**_r_**)eprod, (**_i_**)ntegration, (**_s_**)andbox |
| `code`         | _4 char_       | [ <App_code> ]            | Application code                                                                               |
| `index`        | _2 char_       | [ xx ]                    | Index number for container                                                                     |

EventGrid Domain Name construction :

> _[cloud_prefix]-[Type]-[environment]-[code]-[index]_

Example :

> _az-egd-p-jmpa-01_

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

# How to use EventGrid Domain module

Module declaration :

```json
module "apgvnr" {
  source                 = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_eventgrid_domain?ref=master"
  providers              = { azurerm = azurerm.xx }
  assie_rgName           = var.assie_rgName
  assie_rgLocation       = var.assie_rgLocation
  assie_rgTags           = var.assie_rgTags
  module_aegdIndex       = var.module_aegdIndex
  module_create          = var.module_create
  module_aegdInputSchema = var.module_aegdInputSchema
  module_aegdId          = var.module_aegdId
  module_aegdTopic       = var.module_aegdTopic
  module_aegdEventType   = var.module_aegdEventType
  module_aegdSubject     = var.module_aegdSubject
  module_aegdDataVersion = var.module_aegdDataVersion
}
```

## Mandatory Inputs

| Input name         | Input type | Description                                                                                                                                        |
|--------------------|------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| `module_create`    | _boolean_  | Does the resource need to be created? Possible values are true and false.                                                                          |
| `assie_rgTags`     | _map_      | Tags from the Resource Group.                                                                                                                      |
| `assie_rgName`     | _string_   | The name of the resource group in which the EventGrid Domain exists. Changing this forces a new resource to be created.                            |
| `assie_rgLocation` | _string_   | The location/region where the eventGrid Domain will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions |

## Optional Inputs

| Input name               | Input type | Description                                                                                                                                                                                  |
|--------------------------|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `module_aegdInputSchema` | _string_   | Specifies the schema in which incoming events will be published to this domain. Allowed values are CloudEventSchemaV1_0, CustomEventSchema, or EventGridSchema. Defaults to eventgridschema. |
| `module_aegdIndex`       | _string_   | Module Index for EventGrid Domain                                                                                                                                                            |
| `module_aegdId`          | _string_   | Specifies the id of the EventGrid Event to associate with the domain.                                                                                                                        |
| `module_aegdTopic`       | _string_   | Specifies the topic of the EventGrid Event to associate with the domain.                                                                                                                     |
| `module_aegdSubject`     | _string_   | Specifies the subject of the EventGrid Event to associate with the domain.                                                                                                                   |
| `module_aegdDataVersion` | _string_   | Specifies the data version of the EventGrid Event to associate with the domain.                                                                                                              |
| `module_aegdEventType`   | _string_   | Specifies the event type of the EventGrid Event to associate with the domain.                                                                                                                |


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

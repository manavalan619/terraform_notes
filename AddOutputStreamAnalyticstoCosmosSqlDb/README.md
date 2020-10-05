# Module AddOutputEventHubtoCosmosDb
`The development of this module is currently in progress`

## Description
This module adds an Output EventHub to CosmosDb

## Usage
### Module Definitions

- module location : providers/azure/AddOutputEventHubtoCosmosDb

## Usage
### Module Definitions

- module location : providers/azure/FunctionApp

```hcl
  module "darm" {
  source                       = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddOutputStreamAnalyticstoCosmosSqlDb/"
  project_resource_group_name  = var.project_resource_group_name
  arm_template_deployment_name = var.arm_template_deployment_name
  sta_job_name                 = var.sta_job_name
  sta_outputcosmosdb_name      = var.sta_outputcosmosdb_name
  accountId                    = var.accountId
  accountKey                   = var.accountKey
  database                     = var.database
  collectionNamePattern        = var.collectionNamePattern
  resource_deploy              = var.resource_deploy
  resource_depends_on          = var.resource_depends_on
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the template deployment."
}
variable "resource_depends_on" {
  type        = any
  default     = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "arm_template_deployment_name" {
  type        = string
  description = "The name Azure Deployement"
}
variable "sta_job_name" {
  type        = string
  description = "The name of the Stream Analytics Job."
}
variable "sta_outputcosmosdb_name" {
  type        = string
  description = "The name of the cosmos output stream in stream analytics."
}
variable "accountId" {
  type        = string
  description = "The Azure Cosmos DB account name or ID. Required on PUT (CreateOrReplace) requests."
}
variable "accountKey" {
  type        = string
  description = "The account key for the Azure Cosmos DB account. Required on PUT (CreateOrReplace) requests."
}
variable "database" {
  type        = string
  description = "The name of the Azure Cosmos DB database. Required on PUT (CreateOrReplace) requests."
}
variable "collectionNamePattern" {
  type        = string
  description = "The collection name pattern for the collections to be used. The collection name format can be constructed using the optional {partition} token, where partitions start from 0. See the Azure Cosmos DB section of https://docs.microsoft.com/rest/api/streamanalytics/stream-analytics-output for more information. Required on PUT (CreateOrReplace) requests."
}
```


## Outputs
The following variables are available as module outputs variables


```
output "sta_output_CosmosdbSql_id" {
  value       = module.darm.sta_output_CosmosdbSql_id
  description = "The ID of the Stream Analytics Cosmos DB Sql output."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
        project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
    ```
* example for `p` environment :
    ```hcl
        project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
    ```
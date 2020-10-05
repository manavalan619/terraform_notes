variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the template deployment."
}
variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# Cosmos DB in Stream Analytics - Variables   sta_outputcosmosdb
# ==============================================================================
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
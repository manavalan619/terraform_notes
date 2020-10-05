
variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
}
variable "adf_name" {
  type        = string
  description = "Azure Data Factory name"
}
variable "resource_depends_on" {
  type    = list(any)
  default = null
}

variable "project_name" {
  type        = string
  description = "Project name"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}

# ==============================================================================
# SSIS-IR - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if ssis intergation runtime should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
### Azure-SSIS integration runtime info - This is a Data Factory compute resource for running SSIS packages.
variable "adf_ssis_name" {
  type        = string
  description = "Azure SSIS Name"
}
variable "adf_ssis_description" {
  type        = string
  description = "Azure SSIS Integration Runtime"
}
variable "adf_ssis_node_size" {
  type        = string
  description = "Azure SSIS Node Size. Example value : Standard_D8_v3 "
  default     = "Standard_D8_v3"
}
variable "adf_ssis_node_number" {
  type        = number
  description = "Azure SSIS Node Number. 1-10 nodes are currently supported"
  default     = 2
}
variable "adf_ssis_edition" {
  type        = string
  description = "Azure SSIS Edition. (Standard or Enterprise)"
  default     = "Standard"
}
variable "adf_ssis_license_type" {
  type        = string
  description = "Azure SSIS License Type"
  default     = "LicenseIncluded"
}
variable "adf_ssis_max_parallel_execution_per_node" {
  type        = number
  description = "Azure SSIS Max Parallel Executions Per Node. For a Standard_D1_v2 node, up to four parallel executions per node are supported. For other nodes, up to (2 x number of cores) are currently supported."
  default     = 8
}

# Custom setup info: Standard/express custom setups
variable "adf_ssis_setup_script_container_sas_uri" {
  type        = string
  description = "Setup Script Container Sas Uri"
}
variable "adf_ssis_express_custom_setup" {
  type        = string
  description = "Express Custom Setup"
}

# Virtual network info: Classic or Azure Resource Manager
variable "adf_ssis_vnet_id" {
  type        = string
  description = "Vnet Id"
}
variable "adf_ssis_subnet_name" {
  type        = string
  description = "Subnet Name"
}
# Public IP address info: OPTIONAL to provide two standard static public IP addresses with DNS name under the same subscription and in the same region as your virtual network
variable "adf_ssis_first_public_ip" {
  type        = string
  description = "First Public IP"
}
variable "adf_ssis_second_public_ip" {
  type        = string
  description = "Second Public IP"
}

### SSISDB info
variable "adf_ssis_db_server_endpoint" {
  type        = string
  description = "SSISDB Server Endpoint. Example value : sqlsrv-dv-ne-h7ca6nu6.database.windows.net  WARNING: If you use SSISDB, ensure that there's no existing SSISDB on your database server, so we can prepare and manage one on your behalf."
}
# Authentication info: SQL or Azure AD
variable "adf_ssis_db_server_admin_user_name" {
  type        = string
  description = "SSISDB Server Admin User Name. Let empty if AD Authentification"
}
variable "adf_ssis_db_server_admin_password" {
  type        = string
  description = "SSIS DB Server Admin Password. Let empty if AD Authentification"
}
variable "adf_ssis_db_pricing_tier" {
  type        = string
  description = "SSIS DB Pricing Tier.For the basic pricing tier, specify 'Basic,' not 'B.' For standard, premium, and elastic pool tiers, specify 'S0,' 'S1,' 'S2,' 'S3,' etc. See https://docs.microsoft.com/azure/sql-database/sql-database-resource-limits-database-server."
  default     = "S0"
}

### Self-hosted integration runtime info - This can be configured as a proxy for on-premises data access 
variable "adf_ssis_data_proxy_ir_name" {
  type        = string
  description = "Data Proxy Integration Runtime Name"
  default     = ""
}
variable "adf_ssis_data_proxy_staging_linked_service_name" {
  type        = string
  description = "Data Proxy Staging Linked Service Name"
}
variable "adf_ssis_data_proxy_staging_path" {
  type        = string
  description = "Data Proxy Staging Path"
}

variable "sqlsrv_ad_admin_group" {
  type        = string
  description = "(Required) The aad groupb name to set as the server administrator"
}

# ======================================================
# APIM module
# ======================================================

module "apim" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/ApiManagement/"
  project_resource_group_name = var.project_resource_group_name
  apim_publisher_name         = var.apim_publisher_name
  apim_publisher_email        = var.apim_publisher_email
  apim_sku_name               = var.apim_sku_name
  resource_deploy             = var.resource_deploy
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  apim_xml_content            = var.apim_xml_content
}

# Create CosmosDb Account
module "acdb_mongo_collection" {
  source                                    = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/CosmosMongoCollection/"
  project_resource_group_name               = var.project_resource_group_name
  acdb_name                                 = var.acdb_name
  project_name                              = var.project_name
  env_code                                  = var.env_code
  short_project_name                        = var.short_project_name
  location_code                             = var.location_code
  resource_index                            = var.resource_index
  acdb_mongo_collection_default_ttl_seconds = var.acdb_mongo_collection_default_ttl_seconds
  acdb_mongo_collection_shard_key           = var.acdb_mongo_collection_shard_key
  acdb_mongo_collection_throughput          = var.acdb_mongo_collection_throughput
  acdb_mongo_db_name                        = var.acdb_mongo_db_name
  resource_deploy                           = var.resource_deploy
  resource_depends_on                       = var.resource_depends_on
}
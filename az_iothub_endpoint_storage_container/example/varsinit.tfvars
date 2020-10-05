project_resource_group_name          = "RG-TOTAL-WU-GEORGE"
asa_name                             = "sampledemoevent"
asa_kind                             = "StorageV2"
asa_enable_https_traffic_only        = true
asa_tier                             = "Standard"
asa_replication_type                 = "GRS"
resource_deploy                      = true
ascn_name                            = "sampledemocontainereventiot"
ascn_container_access_type           = "private"
aioth_sku_name                       = "S1"
aioth_sku_capacity                   = "1"
aiothepsc_batch_frequency_in_seconds = 60
aiothepsc_max_chunk_size_in_bytes    = 10485760
aiothepsc_encoding                   = "JSON"
aiothepsc_file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
project_name                         = ""
short_project_name                   = ""
resource_index                       = 1
env_code                             = "dv"
location_code                        = "ne"
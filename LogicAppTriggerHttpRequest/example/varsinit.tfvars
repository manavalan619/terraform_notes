project_resource_group_name = "RG-TOTAL-WU-GEORGE"
alaw_name                   = "alaw-dv-test-george"
project_name                = "testproj"
short_project_name          = "test"
env_code                    = "dv"
resource_index              = 1
location_code               = "ne"
alathr_schema               = <<SCHEMA
{
    "type": "object",
    "properties": {
        "hello": {
            "type": "string"
        }
    }
}
SCHEMA
alathr_method               = "GET"
alathr_relative_path        = "/"
resource_deploy             = true

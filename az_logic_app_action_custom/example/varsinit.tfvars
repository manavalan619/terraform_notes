assie_rgName = "RG-TOTAL-WU-GEORGE"
assie_rgTags = {
  Environment     = "D"
  ApplicationName = "TERRAFORM_DEVOPS-I"
  ApplicationCode = "TFDI"
  Branch          = "TGS"
  Exploitation    = "BOOST"
  SecurityLevel   = "Standard"
}
alaw_name           = "alaw-dv-test-george"
module_alaacIndex   = "01"
module_create       = true
module_alaaBody     = <<BODY
{
    "description": "A variable to configure the auto expiration age in days. Configured in negative number. Default is -30 (30 days old).",
    "inputs": {
        "variables": [
            {
                "name": "ExpirationAgeInDays",
                "type": "Integer",
                "value": -30
            }
        ]
    },
    "runAfter": {},
    "type": "InitializeVariable"
}
BODY
resource_depends_on = null

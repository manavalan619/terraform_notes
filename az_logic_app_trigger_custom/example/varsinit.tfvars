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
module_alatcBody    = <<BODY
{
  "recurrence": {
    "frequency": "Day",
    "interval": 1
  },
  "type": "Recurrence"
}
BODY
resource_depends_on = null
module_create       = true
module_alatcIndex   = "01"
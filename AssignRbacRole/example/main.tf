# Create ressources group
module "role" {
  source = "../../AssignRbacRole/"
  aad_group_list = ["ZG-AZR-TG-PATTERN1-TECHLEAD", "ZG-AZR-TG-PATTERN1-DEVELOPER"]
  role_scope_ids = ["/subscriptions/***f/resourceGroups/rg-total-dv-ne-tg-pattern1/providers/Microsoft.DataFactory/factories/adf-dv-ne-7pe3h5jx"]
  role_definition_name = "Contributor"
}

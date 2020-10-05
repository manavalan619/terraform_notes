# ======================================================
# SQL Virtual Network Rule - Output Variables
# ======================================================
output "asvnr_id" {
  value       = module.asvnr.asvnr_id
  description = "The ID of the SQL virtual network rule."
}

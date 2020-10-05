# ==============================================================================
# STA Output variables
# ==============================================================================

# The STA JOB ID.
output "sta_outputsqldb_id" {
  value       = module.sta_outputsqldb.sta_outputsqldb_id
  description = "The ID of the Stream Analytics Output Microsoft SQL Server Database."
}

# The STA JOB ID.
output "sta_job_id" {
  value       = module.sta.sta_job_id
  description = "The Job ID assigned by the Stream Analytics Job."
}
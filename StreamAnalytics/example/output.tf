# ==============================================================================
# STA Output variables
# ==============================================================================
# The STA ID.
output "sta_id" {
  value       = module.sta.sta_id
  description = "The ID of the Stream Analytics Job."

}
# The STA JOB ID.
output "sta_job_id" {
  value       = module.sta.sta_job_id
  description = "The Job ID assigned by the Stream Analytics Job."

}
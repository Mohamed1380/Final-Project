output "ssh" {
  description = "GCloud ssh command to connect to the Bastion instance."
  value       = "gcloud compute ssh ${google_compute_instance.mymachine.name} --project ${var.project} --zone ${google_compute_instance.mymachine.zone} -- -L8888:127.0.0.1:8888"
}
output "myvpc_id" {
  value = google_compute_network.myvpc.id
}

output "myvpc_name" {
  value = google_compute_network.myvpc.name
}

output "restricted_name" {
  value = google_compute_subnetwork.restrictedsubnet.name
}

output "management_name" {
  value = google_compute_subnetwork.managementsubnet.name
}
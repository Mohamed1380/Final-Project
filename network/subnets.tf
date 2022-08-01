resource "google_compute_subnetwork" "managementsubnet" {
  name          = "managementsubnet"
  ip_cidr_range = var.management_cider_range
  region        = var.region
  private_ip_google_access = true
  network       = google_compute_network.myvpc.id
}

resource "google_compute_subnetwork" "restrictedsubnet" {
  name          = "restrictedsubnet"
  ip_cidr_range = var.restricted_cider_range
  region        = var.region
  private_ip_google_access = true
  network       = google_compute_network.myvpc.id
}
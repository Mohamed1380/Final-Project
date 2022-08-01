
data "template_file" "startup_script" {
  template = <<-EOF
  sudo apt-get update -y
  sudo apt-get install -y tinyproxy
  echo "Allow localhost"| tee -a /etc/tinyproxy/tinyproxy.conf
  systemctl restart tinyproxy
  EOF
}

// Private machine

resource "google_compute_instance" "mymachine" {
  name         = "mymachine"
  machine_type = "e2-medium"
  zone         = "us-west2-a"
  tags = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "${module.network.myvpc_name}"
    subnetwork = "${module.network.management_name}"

  }

  metadata_startup_script = data.template_file.startup_script.rendered

}
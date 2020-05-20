// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 2
}

// Random integer pick a zone in random. Just for fun
resource "random_integer" "dice_roll" {
  min = 1
  max = 10
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
  name         = "first-vm-${random_id.instance_id.hex}"
  machine_type = var.gcp_machine_type
  zone = data.google_compute_zones.available.names[
  random_integer.dice_roll.result % length(data.google_compute_zones.available.names)]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}

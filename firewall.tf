resource "google_compute_firewall" "vm_ssh_access" {
  name    = "vm-ssh-access"
  network = data.google_compute_network.default.name

  // Despite firewall rule name, Allow ICMP (ping) too
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  // Allow access for any IP.
  // Hint: This includes cloud shell access.
  // For demonstartion only.
  source_ranges = ["0.0.0.0/0"]

  // Apply this firewall rule only to the vm created in this example,
  // using network tag
  target_tags    = ["first-vm"]

  disabled = true
}

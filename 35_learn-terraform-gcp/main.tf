terraform {
  cloud {
    organization = "yossi"

    workspaces {
      name = "poc-gcp-20240721"
    }
  }
}

resource "google_compute_network" "my" {
  project                 = "terraform-20240721"
  name                    = "my-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_firewall" "ssh" {
  project = "terraform-20240721"
  name    = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.my.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "flask" {
  project = "terraform-20240721"
  name    = "flask-app-firewall-with-terraform-cloud"
  network = google_compute_network.my.id

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_subnetwork" "my" {
  project       = "terraform-20240721"
  name          = "my-custom-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west1"
  network       = google_compute_network.my.id
}

# Create a single Compute Engine instance
resource "google_compute_instance" "my" {
  project      = "terraform-20240721"
  name         = "flask-vm"
  machine_type = "f1-micro"
  zone         = "us-west1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python3-pip rsync; pip install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.my.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

// A variable for extracting the external IP address of the VM
output "Web-server-URL" {
  value = join("", ["http://", google_compute_instance.my.network_interface.0.access_config.0.nat_ip, ":5000"])
}

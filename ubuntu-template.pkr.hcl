source "vsphere-iso" "ubuntu-template" {
  # vSphere connection settings
  vcenter_server      = var.vcenter_server_address
  username            = var.vcenter_username
  password            = var.vcneter_password
  insecure_connection = true
  host        = var.host_address
  datacenter  = var.datacenter
  datastore   = var.datastore

  # VM settings
  vm_name              = var.vm_name
  guest_os_type        = var.guest_os_type
  CPUs                 = var.CPUs
  RAM                  = var.RAM
  RAM_reserve_all      = var.RAM_reserve_all
  disk_controller_type = var.disk_controller_type
  convert_to_template  = true
  export {
    force            = true
    output_directory = "./output-artifacts"
  }

  # Disk settings
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = true
  }

  # Network settings
  network_adapters {
    network_card = var.network_card
    network      = var.network # Make sure to specify your actual network name
  }

  # ISO settings
  iso_paths = var.iso_paths


  # HTTP settings for cloud-init
  http_directory = "./http"
  http_port_min  = 8000
  http_port_max  = 8050

  # Boot and installation settings
  boot_wait = var.boot_wait
  boot_command = var.boot_command

  # SSH settings
  ssh_username           = var.ssh_username
  ssh_password           = var.ssh_password
  ssh_port               = var.ssh_port
  ssh_timeout            = var.ssh_timeout
  ssh_handshake_attempts = var.ssh_handshake_attempts


  # Shutdown settings
  shutdown_command = "echo 'ubuntu' | sudo -S shutdown -P now"
}

build {
  sources = ["source.vsphere-iso.ubuntu-template"]

  provisioner "shell" {
    inline = [
      "echo 'SSH connection successful!'",
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo ufw allow proto tcp from any to any port 22,80,443",
      "echo 'y' | sudo ufw enable"
    ]
  }
}
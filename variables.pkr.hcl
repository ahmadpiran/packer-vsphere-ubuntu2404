variable "vcenter_server_address" {
  type = string
  default = "<SERVER_ADDRESS>"
  sensitive = true
}

variable "vcenter_username" {
  type = string
  default = "<USERNAME>"
  sensitive = true
}

variable "vcenter_password" {
  type = string
  default = "<PASSWORD>"
  sensitive = true
}

variable "host_address" {
  type = string
  default = "<HOST_ADDRESS>"
}

variable "datacenter" {
  type = string
  default = "<DATACENTER>"
}

variable "datastore" {
  type = string
  default = "<DATASTORE>"
}
variable "vm_name" {
  type = string
  default = "ubuntu-packer"
}
variable "guest_os_type" {
  type = string
  default = "ubuntu64Guest"
}
variable "CPUs" {
  type = number
  default = 2
}
variable "RAM" {
  type = number
  default = 4096
}
variable "RAM_reserve_all" {
  type = bool
  default = true
}
variable "disk_controller_type" {
  type = list(string)
  default = ["pvscsi"]
}

variable "disk_size" {
  type = number
  default = 32768
}

variable "network_card" {
  type = string
  default = "vmxnet3"
}
variable "network" {
  type = string
  default = "VM Network"
}
variable "iso_paths" {
  type = list(string)
  default = ["[<DATASTORE>] repo/ubuntu-24.04.1-live-server-amd64.iso"]
}

variable "boot_wait" {
  type = string
  default = "10s"
}

variable "boot_command" {
  type = list(string)
  default = [
    "<esc><wait>",
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\"<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter><wait>"
  ]
}

variable "ssh_username" {
  type = string
  default = "ubuntu"
}
variable "ssh_password" {
  type = string
  default = "ubuntu"
}

variable "ssh_timeout" {
  type = string
  default = "60m"
}

variable "ssh_handshake_attempts" {
  type = string
  default = "100"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable zone {
  default = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable private_key_path {
  default = "~/.ssh/appuser"
}

variable db_internal_ip {
  description = "Database URL"
}

variable db_external_ip {
  description = "Database External IP"
}

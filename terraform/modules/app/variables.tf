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

variable database_url {
	description = "Database URL"
}

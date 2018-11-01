provider "google" {
 version = "1.4.0"
 project = "${var.project}"
 region = "${var.region}"
}

module "storage-bucket" {
 source = "SweetOps/storage-bucket/google"
 version = "0.1.1"
 name = ["states-of-terraform"]
}

output "storage-bucket_url" {
 value = "${module.storage-bucket.url}"
}

terraform {
  backend "gcs" {
    bucket = "states-of-terraform"
    prefix = "infrastructure"
  }
}

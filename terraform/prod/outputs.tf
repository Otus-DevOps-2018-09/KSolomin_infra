output "app_external_ip" {
  value = "${module.app.app_external_ip}"
}

output "storage-bucket_url" {
  value = "${module.storage-bucket.url}"
}

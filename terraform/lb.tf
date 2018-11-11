resource "google_compute_forwarding_rule" "load_balancer" {
  name       = "forwarding-rule"
  target     = "${google_compute_target_pool.reddit-app-pool.self_link}"
  port_range = "9292"
}

resource "google_compute_target_pool" "reddit-app-pool" {
  name          = "website-target-pool"
  instances     = ["${data.google_compute_instance_group.all.instances}"]
  health_checks = ["${google_compute_http_health_check.default.name}"]
}

resource "google_compute_http_health_check" "default" {
  name               = "default"
  request_path       = "/"
  check_interval_sec = 10
  timeout_sec        = 1
  port               = "9292"
}

resource "google_compute_instance_group" "reddit-app-group" {
  name = "reddit-app-group"
  zone = "${var.zone}"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]
}

data "google_compute_instance_group" "all" {
  name = "${google_compute_instance_group.reddit-app-group.name}"
  zone = "${var.zone}"
}

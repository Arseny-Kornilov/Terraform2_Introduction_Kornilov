output "vm_platform_info" {
  value = {
    name   = yandex_compute_instance.platform.name
    external_ip  = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn        = yandex_compute_instance.platform.fqdn
  }
}

output "vm_db_info" {
  value = {
    name   = yandex_compute_instance.netology-develop-platform-db.name
    external_ip  = yandex_compute_instance.netology-develop-platform-db.network_interface.0.nat_ip_address
    fqdn        = yandex_compute_instance.netology-develop-platform-db.fqdn
  }
}

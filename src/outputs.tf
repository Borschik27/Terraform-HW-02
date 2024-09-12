/*
output "vm_details" {
  value = {
    vm = {
      name        = yandex_compute_instance.vm.name
      external_ip = yandex_compute_instance.vm.network_interface.0.nat_ip_address
      fqdn        = "${yandex_compute_instance.vm.name}.${var.domain}"  # Замените на актуальное доменное имя, если у вас есть
    }
    vm-b = {
      name        = yandex_compute_instance.vm-b.name
      external_ip = yandex_compute_instance.vm-b.network_interface.0.nat_ip_address
      fqdn        = "${yandex_compute_instance.vm-b.name}.${var.domain}"  # Замените на актуальное доменное имя, если у вас есть
    }
  }
  description = "Details of the virtual machines, including name, external IP, and FQDN."
}
*/

######For vms_platform
output "vm_details" {
  description = "Details for each VM"
#  sensitive = true
  
  value = {
    for vm_name, vm_data in yandex_compute_instance.vm : vm_name => {
      name    = vm_data.name
      ip      = vm_data.network_interface[0].nat_ip_address
      cores   = vm_data.resources[0].cores
      memory  = vm_data.resources[0].memory
      metadata = vm_data.metadata
    }
  }
}
/*
resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
}

resource "yandex_compute_instance" "vm-b" {
  name        = local.vm_name_db
  platform_id = var.platform_id
  zone        = var.vm_db_zone
  resources {
    cores         = var.vm_db_c_cpu
    memory        = var.vm_db_mem
    core_fraction = var.vm_db_c_frac
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vm_user}:${var.vms_ssh_root_key}"
  }
}
*/
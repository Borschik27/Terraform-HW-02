resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
/*
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
*/
resource "yandex_vpc_subnet" "develop" {
  for_each = var.vms_resources
  name           = "${var.vpc_name}-${each.key}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value.cidr_block]
}

data "yandex_compute_image" "my_image" {
  family = var.image_family
}

/*
resource "yandex_compute_instance" "vm" {
  name        = local.vm_name_main
  platform_id = var.platform_id
  zone        = var.default_zone
  resources {
    cores         = var.c_cpu
    memory        = var.mem
    core_fraction = var.c_frac
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
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vm_user}:${var.vms_ssh_root_key}"
  }
}
*/
################ for terraform.tfvarss

resource "yandex_compute_instance" "vm" {
  for_each = var.vms_resources

  name        = each.value.name
  platform_id = each.value.platform_id
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      size = each.value.hdd_size
      type = each.value.hdd_type
    }
}

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = false
  }

  metadata = local.metadata

  zone = each.value.zone
}


###############

data "yandex_vpc_network" "net" {
  folder_id = var.folder_id
  name      = var.vpc_name
}

resource "yandex_vpc_subnet" "subnet" {
  folder_id      = var.folder_id
  name           = var.vpc_name
  v4_cidr_blocks = var.default_cidr
  zone           = var.default_zone
  network_id     = data.yandex_vpc_network.net.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = var.gw_name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = var.folder_id
  name       = var.vpc_route_name
  network_id = data.yandex_vpc_network.net.id

  static_route {
    destination_prefix = var.prefix
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
#  token                    = var.token
  service_account_key_file = file("${var.ppkyc}")
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
#  zone                     = var.default_zone
}

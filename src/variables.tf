###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop-b"
  description = "VPC-b network & subnet name"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_zone" {
  type        = string
  default = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
  default     = ["10.0.1.0/24"]
}

variable "ppkyc" {
  type        = string
  description = "Path to key"
}

variable "image_family" {
  type        = string
  description = "Image family for the VM"
}

variable "platform_id" {
  type        = string
  description = "Platform ID for the VM"
}

variable "vm_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM Name"
}

variable "c_cpu" {
  type        = number
  default     = 2
  description = "Number of CPU cores for the VM"
}

variable "mem" {
  type        = number
  default     = 2
  description = "Memory in GB for the VM"
}

variable "c_frac" {
  type        = number
  default     = 50
  description = "Core fraction for the VM"
}

variable "vm_user" {
  type        = string
  description = "SSH user for the VM"
}

variable "vms_ssh_root_key" {
  type        = string
  description = "SSH root key for the VM"
}

# Additional variables for the second VM
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the second VM"
}

variable "vm_db_c_cpu" {
  type        = number
  default     = 2
  description = "Number of CPU cores for the second VM"
}

variable "vm_db_mem" {
  type        = number
  default     = 2
  description = "Memory in GB for the second VM"
}

variable "vm_db_c_frac" {
  type        = number
  default     = 20
  description = "Core fraction for the second VM"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.2.2.0/24"]
  description = "CIDR block for the second VM subnet"
}

###locals
variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Environment (e.g., dev, prod)"
}

variable "vm_id_main" {
  type        = string
  description = "ID for the main VM"
}

variable "vm_id_db" {
  type        = string
  description = "ID for the database VM"
}

variable "domain" {
  type        = string
  description = "Domain name"
}
/*
variable "host_passwd" {
  type        = string
  description = "Host vm password"
}
*/

##### for terraform.tfvars
variable "vms_resources" {
  type = map(object({
    name          = string
    cores         = number
    memory        = number
    hdd_size      = number
    hdd_type      = string
    core_fraction = number
    metadata      = map(string)
    platform_id   = string
    zone          = string
    cidr_block    = string
  }))
}

variable "test" {
  type = list(map(list(string)))
}

variable "vpc_route_name" {
  type        = string
  description = "Route name"

}
variable "gw_name" {
  type        = string
  description = "Gateway name"
}

variable "prefix" {
  type        = string
}
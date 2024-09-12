locals {
  vm_name_main = "${var.project_name}-${var.environment}-${var.vm_name}-${var.vm_id_main}"
  vm_name_db = "${var.project_name}-${var.environment}-${var.vm_db_name}-${var.vm_id_db}"
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vm_user}:${var.vms_ssh_root_key}"
  }
}

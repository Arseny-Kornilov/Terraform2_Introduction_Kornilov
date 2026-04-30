locals {
  connection_defaults = {
    type        = "ssh"
    user        = "vboxuser"
    private_key = file("/home/vboxuser/Terraform2_Introduction_Kornilov/Terraform_2.pub")
    timeout     = "2m"
  }
  cloud_id = {
    type = "string"
    description = "b1gc4hg3apeuqktj3l58"
  }
  folder_id = {
    type = "string" 
    description = "b1g95b3p66i5e05fo7pa"
  }
}

locals {
  ssh_public_key = file(var.ssh_key_path)
}

locals {
  vm_web_name = "${var.prefix_vm}-${var.vpc_name}-${var.web_instance_name}"
  vm_db_name  = "${var.prefix_vm}-${var.db_subnet_name}-${var.db_instance_name}"
}

locals {
  common_metadata = {
    serial-port-enable = 1
    ssh-keys           = "vboxuser:${local.ssh_public_key}"
  }
}

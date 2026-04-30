###cloud vars


variable "cloud_id" {
  type        = string
  default     = var.cloud_id
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = var.folder_id
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type    = string
  default = "local.connection_defaults.private_key"
  description = "ssh-keygen -t ed25519"
}

variable "vm_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "VM Family"
}

variable "ssh_key_path" {
  type = string
  default = "/home/vboxuser/.ssh/new_key.pub"
  sensitive = true
}

variable "prefix_vm" {
  type    = string
  default = "netology"
}

variable "web_instance_name" {
  type    = string
  default = "-platform-web"
}

variable "db_instance_name" {
  type    = string
  default = "platform-db"
}


variable "vm_resources" {
  type = object({
    web = object({
      cores         = number
      memory        = number
      core_fraction = number
      hdd_size      = number
      hdd_type      = string
    })
    db = object({
      cores         = number
      memory        = number
      core_fraction = number
      hdd_size      = number
      hdd_type      = string
    })
  })
   
  default = {
    web = {
      cores = 2
      memory = 1
      core_fraction = 50
      hdd_size = 10
      hdd_type = "network-hdd"
    }
    db = {
      cores = 2
      memory = 2
      core_fraction = 20
      hdd_size = 10 
      hdd_type = "network-hdd" 
    }
  }
}

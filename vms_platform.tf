variable "vm_web_resources" {
  type = object({
    cores = number
    memory = number
    core_fraction = number
  })
  description = "VM Configuration"

  default = {
    cores = 2
    memory = 1
    core_fraction = 50
  }
}



variable "vm_db_resources" {
  type = object({
    cores = number
    memory = number
    core_fraction = number
  })
  description = "VM Configuration"

  default = {
    cores = 2
    memory = 2
    core_fraction = 20
  }
}

variable "vm_db_zone" {
  type = string
  default = "ru-central1-b"
  description = "zone for db"
}

variable "db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "CIDR for db subnet"
}

variable "db_subnet_name" {
  type = string
  default = "db"
}

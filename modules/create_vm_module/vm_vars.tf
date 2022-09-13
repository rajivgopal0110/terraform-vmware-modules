variable "ipv4_vm" {
  type = string
  description = "Enter the IPv4 address fro the VM"
}

variable "pg_network" {
  
}

variable "cluster" {
  
}

variable "datastore_150" {
  
}

variable "ipv4_gw_vmk" {
  
}

variable "new_vm_name" {
  type = string
  description = "Enter the VM name"
}

variable "new_vm_hostname" {
  type = string
  description = "Enter the VM hostname"
}

variable "new_vm_domain" {
  type = string
  description = "Enter the VM domain"
}

variable "template_name" {
  type = string
  description = "Enter the name of the template"
}

// Datacenter variable
variable "datacenter" {
  type        = string
  description = "Datacenter name"
}
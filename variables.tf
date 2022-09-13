// vCenter variables
variable "vsphere_vcenter_user" {
  type        = string
  description = "Username for the vCenter login"
}
variable "vsphere_vcenter_password" {
  type        = string
  description = "Password for the vCenter login"
}
variable "vsphere_vcenter_server" {
  type        = string
  description = "vCenter server IP/FQDN"
}

// Datacenter variable
variable "datacenter" {
  type        = string
  description = "Datacenter name"
}

// Datastore variable
variable "datastore_150" {
  type        = string
  description = "Datastore name"
}

variable "ipv4_vm" {
  type        = string
  description = "Enter the IPv4 address fro the VM"
}

variable "new_vm_name" {
  type        = string
  description = "Enter the VM name"
}

variable "new_vm_hostname" {
  type        = string
  description = "Enter the VM hostname"
}

variable "new_vm_domain" {
  type        = string
  description = "Enter the VM domain"
}

variable "template_name" {
  type        = string
  description = "Enter the name of the template"
}

// Host variable
variable "vsphere_vcenter_host_150" {
  type        = string
  description = "10.10.0.150 host server IP"
}

// New VMkernel Port Group variable
variable "new_vmk_pg" {
  type        = string
  description = "Datastore name"
}

// New IP for vMotion vmk
variable "ipv4_vmk" {
  type        = string
  description = "Enter the IPv4 address for vMotion vmk"
}

// New Gateway IP for vMotion vmk
variable "ipv4_gw_vmk" {
  type        = string
  description = "Enter the Gateway IPv4 address for vMotion vmk"
}

// New Netmask IP for vMotion vmk
variable "ipv4_netmask_vmk" {
  type        = string
  description = "Enter the Netmask IPv4 address for vMotion vmk"
}

// New VM Port Group variable
variable "new_pg_network" {
  type        = string
  description = "Datastore name"
}

variable "cluster" {

}

variable "pg_network" {

}


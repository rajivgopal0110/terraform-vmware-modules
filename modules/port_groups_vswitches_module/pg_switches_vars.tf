// New VM Port Group variable
variable "new_pg_network" {
  type        = string
  description = "Datastore name"
}

// New VMkernel Port Group variable
variable "new_vmk_pg" {
  type        = string
  description = "Datastore name"
}

// New IP for vMotion vmk
variable "ipv4_vmk" {
  type = string
  description = "Enter the IPv4 address for vMotion vmk"
}

// New Gateway IP for vMotion vmk
variable "ipv4_gw_vmk" {
  type = string
  description = "Enter the Gateway IPv4 address for vMotion vmk"
}

// New Netmask IP for vMotion vmk
variable "ipv4_netmask_vmk" {
  type = string
  description = "Enter the Netmask IPv4 address for vMotion vmk"
}

// Datacenter variable
variable "datacenter" {
  type        = string
  description = "Datacenter name"
}

variable "vsphere_vcenter_host_150" {
  
}
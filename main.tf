module "host_and_cluster" {
  source                   = "./modules/hosts_clusters_module"
  datacenter               = var.datacenter
  vsphere_vcenter_host_150 = var.vsphere_vcenter_host_150
  cluster                  = var.cluster
}

module "port_groups_vswitches" {
  source                   = "./modules/port_groups_vswitches_module"
  datacenter               = var.datacenter
  vsphere_vcenter_host_150 = var.vsphere_vcenter_host_150
  new_pg_network           = var.new_pg_network
  new_vmk_pg               = var.new_vmk_pg
  ipv4_vmk                 = var.ipv4_vmk
  ipv4_gw_vmk              = var.ipv4_gw_vmk
  ipv4_netmask_vmk         = var.ipv4_netmask_vmk
}

module "create_vm" {
  source          = "./modules/create_vm_module"
  datacenter      = var.datacenter
  cluster         = var.cluster
  datastore_150   = var.datastore_150
  ipv4_vm         = var.ipv4_vm
  new_vm_name     = var.new_vm_name
  new_vm_hostname = var.new_vm_hostname
  new_vm_domain   = var.new_vm_domain
  template_name   = var.template_name
  pg_network      = var.pg_network
  ipv4_gw_vmk = var.ipv4_gw_vmk
  depends_on = [
    module.host_and_cluster
  ]
}
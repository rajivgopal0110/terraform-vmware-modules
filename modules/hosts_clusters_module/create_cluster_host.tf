data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_host" "esxi_150_host" {
  name          = var.vsphere_vcenter_host_150
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_compute_cluster" "compute_cluster" {
  name            = var.cluster
  datacenter_id   = data.vsphere_datacenter.datacenter.id
  host_system_ids = data.vsphere_host.esxi_150_host.id[*] //host_system_ids expects a list as input

  drs_enabled = false
  ha_enabled  = false
}
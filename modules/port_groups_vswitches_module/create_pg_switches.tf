data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_host" "esxi_150_host" {
  name          = var.vsphere_vcenter_host_150
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

//Creating a new vSwitch
resource "vsphere_host_virtual_switch" "host_virtual_switch" {
  name           = "newSwitch"
  host_system_id = data.vsphere_host.esxi_150_host.id

  network_adapters = ["vmnic2", "vmnic3"]

  active_nics  = ["vmnic2"]
  standby_nics = ["vmnic3"]
}

// Create a new "dev-portgroup" port group
resource "vsphere_host_port_group" "pg" {
  name                = var.new_pg_network
  host_system_id      = data.vsphere_host.esxi_150_host.id
  virtual_switch_name = vsphere_host_virtual_switch.host_virtual_switch.name
}

//Creating a new port group for vmkernel nic
resource "vsphere_host_port_group" "vmk01" {
  name                = var.new_vmk_pg
  host_system_id      = data.vsphere_host.esxi_150_host.id
  virtual_switch_name = vsphere_host_virtual_switch.host_virtual_switch.name
}

// Creating vmnic for vMotion using the prev port group
resource "vsphere_vnic" "v1" {
  host      = data.vsphere_host.esxi_150_host.id
  portgroup = vsphere_host_port_group.vmk01.name
  ipv4 {
    ip      = var.ipv4_vmk
    netmask = var.ipv4_netmask_vmk
    gw      = var.ipv4_gw_vmk
  }
  netstack = "vmotion"
}
data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_virtual_machine" "template" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.pg_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
    name = var.cluster
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore_150" {
    name = var.datastore_150
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.new_vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore_150.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  wait_for_guest_net_timeout = 0

  /* depends_on = [
    data.vsphere_compute_cluster.cluster
  ] */

  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label            = "disk0"
    size             = 16
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
        linux_options {
            host_name = var.new_vm_hostname
            domain = var.new_vm_domain 
        }
        network_interface {
            ipv4_address = var.ipv4_vm
            ipv4_netmask = 24
        }
        ipv4_gateway = var.ipv4_gw_vmk
    }
  }
}
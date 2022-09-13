provider "vsphere" {
  user                 = var.vsphere_vcenter_user
  password             = var.vsphere_vcenter_password
  vsphere_server       = var.vsphere_vcenter_server
  allow_unverified_ssl = true
}
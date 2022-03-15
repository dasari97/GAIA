
data "vsphere_datacenter" "dc" {
name = "US-LAB"
}

data "vsphere_host" "host" {
  name          = "192.168.53.11"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
name = "13-9TB-EntSSD"
datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
name = "VM Network"
datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "demo_vm_template" {
name = var.template
datacenter_id = data.vsphere_datacenter.dc.id
}
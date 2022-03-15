output "Datacenter_ID" {
    value = data.vsphere_datacenter.dc.id
  }

output "Host-ID" {
  value = data.vsphere_host.host.id
}

output "Datastore_ID" {
    value = data.vsphere_datastore.datastore.id  
}

output "Network_ID" {
  value = data.vsphere_network.network.id
}

output "vm_guest_id" {
    value = data.vsphere_virtual_machine.demo_vm_template.guest_id
}

output "provisioning_type" {
    value = data.vsphere_virtual_machine.demo_vm_template.disks.0.thin_provisioned
}

provider "vsphere" {
user = var.vsphere_user
password = var.vsphere_password
vsphere_server = var.vsphere_server
allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "vm" {
  count = var.No_of_vms
  name             = element(var.VM_name, count.index)
  resource_pool_id = ""
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.No_of_cpu
  memory           = var.size_of_memory
  wait_for_guest_net_timeout = 1
  wait_for_guest_ip_timeout = 1

  guest_id         = data.vsphere_virtual_machine.demo_vm_template.guest_id
  scsi_type        = data.vsphere_virtual_machine.demo_vm_template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
  }
  disk {
    label             = "disk0"
    size             = 100
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.demo_vm_template.id
    customize {
      linux_options {
        host_name = data.vsphere_host.host.name
        domain    = ""
      }
    }
  }
}

output "VM_ip" {
  value = resource.vsphere_virtual_machine.vm.*.default_ip_address
}

output "pool_name" {
  value = data.vsphere_virtual_machine.demo_vm_template
  }
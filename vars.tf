variable "vsphere_user" {
    default = "dasari.krishna@betsol.com"
}
variable "vsphere_password" {
    default = "9494342038@aA"
}
variable "vsphere_server" {
    default = "192.168.53.20"
}

variable "template" {}
variable "cluster_name" {}
variable "pool_name" {}
variable "No_of_vms" {}
variable "No_of_cpu" {}
variable "size_of_memory" {}
variable "VM_name" {
    type = list
}
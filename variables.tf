############################ Variables Container Cluster #######################

variable "cluster_name" {
  type = string
}
variable "network_vpc" { type = string }
variable "node_locations" { type = list(any) }
variable "cluster_version" { type = string }
variable "pod_network_name" { type = string }
variable "service_network_name" { type = string }
variable "master_ipv4_cidr_block" { type = string }
variable "display_name" { type = string }
variable "project_name" { type = string }
variable "subnetwork" { type = string }
variable "cluster_location" { type = string }
variable "network_project_id" { type = string }


############################ Variables Node_Pool #######################
variable "auto_repair" { type = bool }
variable "auto_upgrade" { type = bool }
variable "node_name" { type = string }

#node_config
variable "disk_size_gb" { type = number }
variable "disk_type" { type = string }
variable "image_type" { type = string }
variable "local_ssd_count" { type = number }
variable "machine_type" { type = string }

variable "max_node_count" {
  type    = number
  default = 2
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "initial_node_count" {
  type    = number
  default = 1
}

variable "max_pods_per_node" {
  type    = number
  default = 20
}
############################ Variables Container Cluster #######################

#names
cluster_name = "kaas-cluster-teste"
display_name = "bento-test"
project_name = "gglobo-kaas-hdg-dev"


#locations
cluster_location = "southamerica-east1"
node_locations   = ["southamerica-east1-a", "southamerica-east1-b", "southamerica-east1-c"]

#Node_Version
cluster_version = "1.21.11-gke.1900"

#Networks
network_vpc            = "vpc-hdg-devqa"
master_ipv4_cidr_block = "10.98.115.192/28"
pod_network_name       = "extra-range-0"
service_network_name   = "extra-range-1"
subnetwork             = "sb-kaas-sa-e1-hdg-dev"
network_project_id     = "gglobo-network-hdg-spk-devqa"



############################ Variables Node_Pool #######################

auto_repair  = "false"
auto_upgrade = "false"
node_name    = "pool-0"

#node_config
disk_size_gb    = 100
disk_type       = "pd-standard"
image_type      = "COS_CONTAINERD"
local_ssd_count = "0"
machine_type    = "n1-standard-2"





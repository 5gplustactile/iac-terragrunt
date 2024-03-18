terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/tf-rke2?ref=main"
}

# dependency is executed before tf-rke2 module
#dependency "vpc-peering" {
#  config_path = "../vpc-peering"
#  skip_outputs = true
#}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr = "172.2.0.0/16"
  vpc_name = "uma-data-escalability"
  cidr_block_snet_op_region = "172.2.4.0/24"
  cidr_block_snet_op_local = "172.2.5.0/24"
  key_name = "uma-data-escalability"
  name_bastion_host = "uma-bastion-data-escalability"
  enable_bastion_host = true
  name_lb = "nlb-uma-data"
  monitoring = true
  cidr_block_vpc_digital_twins = ""
  email_list = ["alvaroandres.anayaamariles@telefonica.com"]
  masters = {
    "uma-data-escalability-master-0" = {
      private_ip = "172.2.5.10"
      control_plane_in_edge = false
    }
    "uma-data-escalability-master-1" = {
      private_ip = "172.2.5.11"
      control_plane_in_edge = false
    }
#    "prod-cluster-mgmt-master-2" = {
#      private_ip = "172.0.5.12"
#      control_plane_in_edge = false
#    }    
  }
  workers = {
    "uma-data-escalability-worker-0" = {
      private_ip = "172.2.5.13"
      worker_in_edge = true
    }
    "uma-data-escalability-worker-1" = {
      private_ip = "172.2.5.14"
      worker_in_edge = true
    }
#   "prod-cluster-mgmt-worker-2" = {
#     private_ip = "172.0.5.14"
#     worker_in_edge = false
#   }
  }

  default_tags = {
    subject = "cluster to UMA for data and escalability"
    environment = "edge and region"
    owner = "jfaldanam@uma.es"
    project = "tactile5g"
  }
  tags = {
    owner = "jfaldanam@uma.es"
    environment = "edge and region"
    project = "tactile5g"
    "kubernetes.io/cluster/cluster-data-escalability" = "shared"
  }

}
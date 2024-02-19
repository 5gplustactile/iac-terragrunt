terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/tf-rke2?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr = "172.0.0.0/16"
  vpc_name = "new-tf-vpc-outpost"
  cidr_block_snet_op_region = "172.0.4.0/24"
  cidr_block_snet_op_local = "172.0.5.0/24"
  key_name = "tactile5g"
  name_bastion_host = "bastion-telefonica"
  enable_bastion_host = true
  name_lb = "new-nlb-tf"
  monitoring = true
  cidr_block_vpc_digital_twins = "172.1.0.0/16"
  email_list = ["alvaroandres.anayaamariles@telefonica.com"]
  masters = {
    "prod-cluster-mgmt-master-0" = {
      private_ip = "172.0.5.10"
      control_plane_in_edge = false
    }
#    "prod-cluster-mgmt-master-1" = {
#      private_ip = "172.0.5.11"
#      control_plane_in_edge = true
#    }
#    "prod-cluster-mgmt-master-2" = {
#      private_ip = "172.0.5.12"
#      control_plane_in_edge = false
#    }    
  }
  workers = {
    "prod-cluster-mgmt-worker-0" = {
      private_ip = "172.0.5.13"
      worker_in_edge = true
    }
#    "prod-cluster-mgmt-worker-1" = {
#      private_ip = "172.0.5.14"
#      worker_in_edge = true
#    }
#   "prod-cluster-mgmt-worker-2" = {
#     private_ip = "172.0.5.14"
#     worker_in_edge = false
#   }
  }

  default_tags = {
    subject = "cluster mgmt to tactile5g project"
    environment = "edge and region"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
  }
  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    environment = "edge and region"
    project = "tactile5g"
    "kubernetes.io/cluster/cluster-mgmt" = "shared"
  }

}
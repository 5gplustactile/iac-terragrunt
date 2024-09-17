terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/tf-rke2?ref=wvl-zone-tf-rke2"
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
  vpc_name = "cluster-multi-zone"
  cidr_block_snet_op_region = "172.2.4.0/24"
  cidr_block_snet_op_local = "172.2.5.0/24"
  cidr_block_snet_wvl = "172.2.6.0/24"
  key_name = "tactile5g"
#  name_bastion_host = "uma-bastion-data-escalability"
  enable_bastion_host = false
  name_lb = "nlb-mz"
  monitoring = false
  cidr_block_vpc_digital_twins = ""
  ami = "ami-05b5a865c3579bbc4"
  email_list = ["alvaroandres.anayaamariles@telefonica.com"]
  outpost_arn = "arn:aws:outposts:eu-west-3:774986117405:outpost/op-067dcd1b4637f98ab"
  masters = {
    "cluster-multi-zone-master-0" = {
      private_ip = "172.2.5.10"
      control_plane_in_edge = false
    }
#    "uma-data-escalability-master-1" = {
#      private_ip = "172.2.5.11"
#      control_plane_in_edge = false
#    }
#    "prod-cluster-mgmt-master-2" = {
#      private_ip = "172.0.5.12"
#      control_plane_in_edge = false
#    }    
  }
  workers = {
    "cluster-multi-zone-worker-0" = {
      private_ip = "172.2.5.13"
      zone = "edge"
    }
    "cluster-multi-zone-worker-1" = {
      private_ip = "172.2.5.14"
      zone = "wvl"
    }
#   "prod-cluster-mgmt-worker-2" = {
#     private_ip = "172.0.5.14"
#     worker_in_edge = false
#   }
  }
#
  default_tags = {
    subject = "cluster to UMA for data and escalability"
    environment = "edge region wavelength"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
  }
  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    environment = "edge region wavelength"
    project = "tactile5g"
    "kubernetes.io/cluster/cluster-data-escalability" = "shared"
  }

}
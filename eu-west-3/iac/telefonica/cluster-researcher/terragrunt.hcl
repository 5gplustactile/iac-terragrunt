terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/tf-rke2?ref=wvl-zone-tf-rke2-researcher"
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
  vpc_private_subnets = ["172.2.1.0/24", "172.2.2.0/24","172.2.3.0/24"]
  vpc_public_subnets = ["172.2.48.0/24", "172.2.49.0/24","172.2.50.0/24"]
  vpc_cidr_wvl = "192.168.0.0/16"
  private_subnets_wvl = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  public_subnets_wvl = ["192.168.48.0/24", "192.168.49.0/24", "192.168.50.0/24"]
  vpc_name = "cluster-multi-zone"
  cidr_block_snet_op_region = "172.2.4.0/24"
  cidr_block_snet_op_local = "172.2.5.0/24"
  cidr_block_snet_wvl = "192.168.4.0/24"
  key_name = "researcher-aws"
  name_bastion_host = "bastion-researcher"
  enable_bastion_host = true
  name_lb = "nlb-mz"
  monitoring = false
  cidr_block_vpc_digital_twins = ""
  ami = "ami-05b5a865c3579bbc4"
  email_list = ["alvaroandres.anayaamariles@telefonica.com"]
  outpost_arn = "arn:aws:outposts:eu-west-3:774986117405:outpost/op-067dcd1b4637f98ab"
  masters = {
    "cluster-researcher-master-0" = {
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
    "cluster-researcher-worker-0" = {
      private_ip = "172.2.5.13"
      zone = "edge"
    }
    "cluster-researcher-worker-1" = {
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
    subject = "cluster to Telefonica Researchers Team"
    environment = "edge region wavelength"
    owner = "andra.lutu@telefonica.com"
    project = "researcher"
  }
  tags = {
    owner = "andra.lutu@telefonica.com"
    environment = "edge region wavelength"
    project = "researcher"
    "kubernetes.io/cluster/cluster-researcher" = "shared"
  }

}
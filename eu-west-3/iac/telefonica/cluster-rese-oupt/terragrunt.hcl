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
  vpc_cidr = "172.3.0.0/16"
  vpc_name = "vpc-researcher-oupt"
  cidr_block_snet_op_region = "172.3.4.0/24"
  cidr_block_snet_op_local = "172.3.5.0/24"
  key_name = "researcher-aws"
  name_bastion_host = "bastion-telefonica"
  enable_bastion_host = false
  name_lb = "nlb-oupt"
  monitoring = false
  cidr_block_vpc_digital_twins = ""
  email_list = ["alvaroandres.anayaamariles@telefonica.com"]
  ami = "ami-05b5a865c3579bbc4"
  outpost_arn = "arn:aws:outposts:eu-west-3:774986117405:outpost/op-067dcd1b4637f98ab"
  masters = {
    "cluster-rese-oupt-master-0" = {
      private_ip = "172.3.5.10"
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
    "cluster-rese-oupt-worker-0" = {
      private_ip = "172.3.5.13"
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
    subject = "cluster to Telefonica Researchers Team"
    environment = "edge region wavelength"
    owner = "andra.lutu@telefonica.com"
    project = "researcher"
  }
  tags = {
    owner = "andra.lutu@telefonica.com"
    environment = "edge region wavelength"
    project = "researcher"
    "kubernetes.io/cluster/cluster-rese-oupt" = "shared"
  }

}
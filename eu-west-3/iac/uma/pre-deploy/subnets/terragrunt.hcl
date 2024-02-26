terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/subnets?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_id_dt = "vpc-08291124993d8220b"
  cidr_block_vpc_cluster_dc = "172.0.0.0/16"
  route_table_id_cluster_cd = "rtb-07bd53803005c5191"
  vpc_peer_id = "pcx-0f8000664466e752e"
  route_table_id = "rtb-00bee61da9983cd54"

  subnet_region = {
    "uma" = {
      cidr_region = ["172.1.14.0/24","172.1.15.0/24","172.1.16.0/24"]
      az = ["eu-west-3a","eu-west-3b","eu-west-3c"]
    }
  }

  subnet_outpost = {
    "uma" = {
      cidr_block_snet_op_region = "172.1.8.0/24"
    }
  }

  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    description = "subnets to the uma digital twins"
  }
}
terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/subnets?ref=main"
}

# dependency is executed before subnets module
#dependency "vpc-peering" {
#  config_path = "../vpc-peering"
#  skip_outputs = true
#}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_id_dt = "vpc-08291124993d8220b"
  cidr_block_vpc_cluster_dc = "172.0.0.0/16"
  route_table_id_cluster_cd = "rtb-07bd53803005c5191"
  route_table_id = "rtb-00bee61da9983cd54"

  subnet_region = {
    "demo" = {
      cidr_region = ["172.1.23.0/24","172.1.24.0/24","172.1.25.0/24"]
      az = ["eu-west-3a","eu-west-3b","eu-west-3c"]
    }
  }

  subnet_outpost = {
    "demo" = {
      cidr_block_snet_op_region = "172.1.16.0/24"
    }
  }

  default_tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    environment = "edge"
    description = "subnets (private, public and outpost) to digital twins"   
    "kubernetes.io/role/internal-elb" = 1
    availability_zone = "edge" 
  }

  tags = {
    Name = "demo"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    environment = "edge"
    description = "subnets (private, public and outpost) to digital twins"
    "kubernetes.io/cluster/edge-clusters-demo" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
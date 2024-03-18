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
    "example-in-edge" = {
      cidr_region = ["172.1.3.0/24","172.1.4.0/24","172.1.5.0/24"]
      az = ["eu-west-3a","eu-west-3b","eu-west-3c"]
    },
    "example-region-0" = {
      cidr_region = ["172.1.10.0/24","172.1.11.0/24","172.1.12.0/24"]
      az = ["eu-west-3a","eu-west-3b","eu-west-3c"]
    }
  }

  subnet_outpost = {
    "example-in-edge" = {
      cidr_block_snet_op_region = "172.1.8.0/24"
    }
  }

  default_tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    environment = "edge/outpost"
    description = "subnets (private, public and outpost) to digital twins"   
    "kubernetes.io/role/internal-elb" = 1
    availability_zone = "region" 
  }

  tags = {
    Name = "example-region"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    environment = "region"
    description = "subnets (private, public and outpost) to digital twins"
    "kubernetes.io/cluster/region-clusters-example-region" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
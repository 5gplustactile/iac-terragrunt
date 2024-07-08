terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/ec2-instance?ref=main"
}
include {
  path = find_in_parent_folders()
}
inputs = {
#  instances = {
#    "uma-ec2-instance-escalability" = {
#      instance_in_edge = true
#      ami = "ami-05b5a865c3579bbc4"
#     }      
#  }
#  tags = {
#    owner = "ireneeromero@uma.es"
#    environment = "edge"
#    project = "tactile5g"
#  }
#  key_name = "uma-data-escalability"
#  monitoring = false
#  instance_type_region = "t3.medium"
#  vpc_id = "vpc-057b30edf831b5d57"
#  nat_gw_id = "nat-0e1f68e7357b07e72"
#  cidr_block_snet_op_region = "172.2.20.0/24"  # If instance_in_edge true. Cidr subnet to the subnet created in outpost
#  cidr_block_snet_op_local = "172.2.21.0/24"  # If instance_in_edge true. Cidr subnet to the subnet created in outpost used for the local network interface (lni)
#  cidr_private_subnet = "172.2.22.0/24"   #If instance_in_edge false. It is the cidr of the vpc to attach the instance in specific private network"
}
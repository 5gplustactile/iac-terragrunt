terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/ec2-instance?ref=main"
}
include {
  path = find_in_parent_folders()
}
inputs = {
#  instances = {
#    "tef-instance" = {
#      instance_in_edge = false
#      ami = "ami-05b5a865c3579bbc4"
#     }
#    "tef-instance-2" = {
#      instance_in_edge = false
#      ami = "ami-05b5a865c3579bbc4"
#     }       
#  }
#  tags = {
#    owner = "alvaroandres.anayaamariles@telefonica.com"
#    environment = "region"
#    project = "tactile5g"
#  }
#  key_name = "tactile5g"
#  monitoring = true
#  instance_type_region = "t3.medium"
#  vpc_id = "vpc-064c1d985795520f6"
#  nat_gw_id = "nat-0d6e259bc74600e3b"
#  cidr_block_snet_op_region = "172.0.6.0/24"
#  cidr_block_snet_op_local = "172.0.7.0/24"
#  cidr_private_subnet = "172.0.8.0/24"
}
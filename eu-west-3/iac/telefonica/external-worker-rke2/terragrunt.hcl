terraform {
  source = "git@github.com:andresanaya21/tactile5g-local-auto-ztp.git//tf-modules/external-worker-rke2?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  workers = {
#    "tactile5g-cluster-mgmt-rke2-worker-2" = {
#      private_ip = "172.1.5.12"
#      worker_in_edge = true
#    }
  }

  key_name = "tactile5g"
  monitoring = true
  vpc_cidr = "172.0.0.0/16"
  ext_vpc_id = "vpc-08291124993d8220b"

  default_tags = {
    subject = "worker cluster dc/mgmt in digital twins vpc"
    environment = "Outpost"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
  }
  
  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    description = "eni lni to telefonica outpost clusters"
    subject = "worker cluster dc/mgmt in digital twins vpc"
    environment = "Outpost"
  }

  cidr_block_snet_op_region = "172.1.4.0/24"
  cidr_block_snet_op_local = "172.1.5.0/24"
  name_lb = "new-nlb-tf"
  route_table_id = "rtb-00bee61da9983cd54"
}
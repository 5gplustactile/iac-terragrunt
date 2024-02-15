terraform {
  source = "git@github.com:andresanaya21/tactile5g-local-auto-ztp.git//tf-modules/vpc-peering?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_id_cluster_dc = "vpc-064c1d985795520f6"
  vpc_id_dt = "vpc-08291124993d8220b"
  cluster_dc_private_subnets = [ "subnet-0b75599f3fc14b247", "subnet-068080e8e5df32d80", "subnet-07f6dae98681dd140" ]
  list_route_table_id_cluster_dc = ["rtb-07bd53803005c5191","rtb-0b0363706f90c986c"]
  dest_cidr = "172.1.0.0/16"
  cidr_block_vpc_cluster_dc = "172.0.0.0/16"
  rt_id_private_digital_twins = "rtb-00bee61da9983cd54"

  default_tags = {
    subject = "terraform to vpc peering"
    environment = "Outpost"
  }

  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    description = "vpc peering to connect cluster dc to vpc digital tiwns"
  }
}
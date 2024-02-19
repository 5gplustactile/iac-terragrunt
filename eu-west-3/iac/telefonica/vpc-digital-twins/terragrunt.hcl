terraform {
  source = "git@github.com:andresanaya21/5gplustactile/auto-ztp.git//tf-modules/vpc-digital-twins?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr = "172.1.0.0/16"
  vpc_name = "vpc-digital-twins"
  cidr_block_vpc_cluster_dc = "172.1.0.0/16"

  default_tags =  {
    subject = "terraform to deploy vpc-digital-twins cluster"
    environment = "Outpost"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
  }

  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
  }
}
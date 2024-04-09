terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/eni-lni-op?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_digital_twins = "telefonica"
  vpc_id_dt = "vpc-08291124993d8220b"
  instances = {
    "i-07f0c5e732c9ada12" = "172.1.7.0/24"
    "i-0e1db09258aa0850f" = "172.1.6.0/24"

  }

  default_tags = {
    subject = "create subnets in outpost"
    environment = "Outpost"
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    description = "eni lni to telefonica outpost clusters"
  }
    
  tags = {
    owner = "alvaroandres.anayaamariles@telefonica.com"
    project = "tactile5g"
    description = "eni lni to telefonica outpost clusters"
  }
}
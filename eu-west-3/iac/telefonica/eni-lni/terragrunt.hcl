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
#    "i-0f3b28109d7ecf424" = "172.1.26.0/24"
#    "i-01ffd9a98db1e4956" = "172.1.27.0/24"

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
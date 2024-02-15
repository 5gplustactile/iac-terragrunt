terraform {
  source = "git@github.com:andresanaya21/tactile5g-local-auto-ztp.git//tf-modules/eni-lni-op?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_digital_twins = "telefonica"
  vpc_id_dt = "vpc-08291124993d8220b"
  instances = {
#    "i-057776eac0e141ba6" = "172.1.7.0/24"
#    "i-007d7d978a466f552" = "172.1.6.0/24"

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
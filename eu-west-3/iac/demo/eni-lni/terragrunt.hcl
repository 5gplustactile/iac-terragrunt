terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/eni-lni-op?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_digital_twins = "demo"
  vpc_id_dt = "vpc-08291124993d8220b"
#  instances = {
#    "i-0d1575fdc485e40ce" = "172.1.29.0/24"
#    "i-086ad7c1f65363a6d" = "172.1.30.0/24"
#
#  }
#
#  default_tags = {
#    subject = "create subnets in outpost"
#    environment = "Outpost"
#    owner = "alvaroandres.anayaamariles@telefonica.com"
#    project = "tactile5g"
#    description = "eni lni to opentwins outpost clusters"
#  }
#    
#  tags = {
#    owner = "alvaroandres.anayaamariles@telefonica.com"
#    project = "tactile5g"
#    description = "eni lni to opentwins outpost clusters"
#  }
}
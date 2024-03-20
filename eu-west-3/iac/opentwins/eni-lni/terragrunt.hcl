terraform {
  source = "git@github.com:5gplustactile/auto-ztp.git//tf-modules/eni-lni-op?ref=main"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_digital_twins = "opentwins"
  vpc_id_dt = "vpc-08291124993d8220b"
  instances = {
    "i-0f3fce7274f36fcec" = "172.1.17.0/24"
    "i-04ed9a601a9eed376" = "172.1.18.0/24"

  }

  default_tags = {
    subject = "create subnets in outpost"
    environment = "Outpost"
    owner = "sergioip@uma.es"
    project = "tactile5g"
    description = "eni lni to opentwins outpost clusters"
  }
    
  tags = {
    owner = "sergioip@uma.es"
    project = "tactile5g"
    description = "eni lni to opentwins outpost clusters"
  }
}
locals {
    account        = "uma"
    project        = "tactile5g"
    owner          = "alvaroandres.anayaamariles@telefonica.com"
    namespace      = "telefonica"
    default_region = "eu-west-3"
    region         = "eu-west-3"
    account_id = "774986117405"

}

inputs = {
    account        = local.account
    project        = local.project
    owner          = local.owner
    namespace      = local.namespace
    account_id     = local.account_id
    region         = local.region
    default_region = local.default_region   
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "${local.project}-terraformstate-${local.region}-${local.namespace}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = "${local.project}-terraformlock-${local.region}-${local.namespace}"
  
  s3_bucket_tags = {
      name        = "Terraform Remote State"
      account     = local.account
      project     = local.project
      owner       = local.owner
      namespace   = local.namespace
      region      = local.region
      managed     = "terraform"
    }
    dynamodb_table_tags = {
      name        = "Terraform Lock Table"
      account     = local.account
      project     = local.project
      owner       = local.owner
      namespace   = local.namespace
      region      = local.region
      managed     = "terraform"
    }
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

#inputs = {
#  aws_region = "eu-west-3"
#}

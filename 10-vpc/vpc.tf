module "vpc" {
  source             = "git::https://github.com/silpa06/terraform-aws-vpc.git?ref=main"
  project            = var.project_name
  environment        = var.environment
  common_tags        = var.common_tags
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  database_cidr_block = var.database_cidr_block
  is_peering_connection = var.is_peering_connection
}

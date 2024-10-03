output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "database_subnet_ids" {
  value = module.vpc.database_subnet_ids
}

output "database_subnet_group_name" {
  value = module.vpc.db_subnet_group_name
}
# output "az_info" {
#   value = module.vpc.az_info
# }

# output "default_vpc_info" {
#   value = module.vpc.default_vpc_info
# }












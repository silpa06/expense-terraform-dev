module "mysql" {
    source = "git::https://github.com/silpa06/terraform-aws-security-group.git?ref=main"
    proect_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    vpc_id = local.vpc_id
    sg_tags = var.mysql_sg_tags
    common_tags = var.common_tags
  
}
module "backend" {
    source = "git::https://github.com/silpa06/terraform-aws-security-group.git?ref=main"
    proect_name = var.project_name
    environment = var.environment
    sg_name = "backend"
    vpc_id = local.vpc_id
    sg_tags = var.backend_sg_tags
    common_tags = var.common_tags
  
}
module "frontend" {
    source = "git::https://github.com/silpa06/terraform-aws-security-group.git?ref=main"
    proect_name = var.project_name
    environment = var.environment
    sg_name = "frontend"
    vpc_id = local.vpc_id
    sg_tags = var.frontend_sg_tags
    common_tags = var.common_tags
  
}
module "bastion" {
    source = "git::https://github.com/silpa06/terraform-aws-security-group.git?ref=main"
    proect_name = var.project_name
    environment = var.environment
    sg_name = "bastion"
    vpc_id = local.vpc_id
    sg_tags = var.bastion_sg_tags
    common_tags = var.common_tags
  
}
module "ansible" {
    source = "git::https://github.com/silpa06/terraform-aws-security-group.git?ref=main"
    proect_name = var.project_name
    environment = var.environment
    sg_name = "ansible"
    vpc_id = local.vpc_id
    sg_tags = var.ansible_sg_tags
    common_tags = var.common_tags
  
}

# creating ingress rules
resource "aws_vpc_security_group_ingress_rule" "mysql_backend" {
  security_group_id = module.mysql.sg_id
  referenced_security_group_id = module.backend.sg_id
  from_port   = 3306
  ip_protocol = "tcp"
  to_port     = 3306
}

resource "aws_vpc_security_group_ingress_rule" "backend_frontend" {
  security_group_id = module.backend.sg_id
  referenced_security_group_id = module.frontend.sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
}

resource "aws_vpc_security_group_ingress_rule" "frontend_public" {
  security_group_id = module.frontend.sg_id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "mysql_bastion" {
  security_group_id = module.mysql.sg_id
  referenced_security_group_id = module.bastion.sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "backend_bastion" {
  security_group_id = module.backend.sg_id
  referenced_security_group_id = module.bastion.sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
resource "aws_vpc_security_group_ingress_rule" "frontend_bastion" {
  security_group_id = module.frontend.sg_id
  referenced_security_group_id = module.bastion.sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
resource "aws_vpc_security_group_ingress_rule" "mysql_ansible" {
  security_group_id = module.mysql.sg_id
  referenced_security_group_id = module.ansible.sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
resource "aws_vpc_security_group_ingress_rule" "backend_ansible" {
  security_group_id = module.backend.sg_id
  referenced_security_group_id = module.ansible.sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
resource "aws_vpc_security_group_ingress_rule" "frontend_ansible" {
  security_group_id = module.frontend.sg_id
  referenced_security_group_id = module.ansible.sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "bastion_public" {
  security_group_id = module.bastion.sg_id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
resource "aws_vpc_security_group_ingress_rule" "ansible_public" {
  security_group_id = module.ansible.sg_id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-mysql"
  ami = data.aws_ami.expense.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id              = local.database_subnet_id
  associate_public_ip_address = false
  tags = merge (
    var.common_tags,
    var.mysql_tags,
    {
      Name = "${local.resource_name}-mysql"
    }
  )
}

module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-backend"
  ami = data.aws_ami.expense.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [local.backend_sg_id]
  subnet_id              = local.private_subnet_id
  associate_public_ip_address = false
  tags = merge (
    var.common_tags,
    var.backend_tags,
    {
      Name = "${local.resource_name}-backend"
    }
  )
}

module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-frontend"
  ami = data.aws_ami.expense.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id              = local.public_subnet_id
  # associate_public_ip_address = true
  tags = merge (
    var.common_tags,
    var.frontend_tags,
    {
      Name = "${local.resource_name}-frontend"
    }
  )
}

module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-ansible"
  ami = data.aws_ami.expense.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [local.ansible_sg_id]
  subnet_id              = local.public_subnet_id
  user_data = file("expense.sh")
  tags = merge (
    var.common_tags,
    var.ansible_tags,
    {
      Name = "${local.resource_name}-ansible"
    }
  )
}


# aws r53 records creation
# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"

#   zone_name = "devteck.xyz"

#   records = [
    
#     {
#       name    = "mysql"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.mysql.private_ip
#       ]
#     }
#   ]

# }
data "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mysql-sg_id"
}

data "aws_ssm_parameter" "backend_sg_id" {
  name  = "/${var.project_name}/${var.environment}/backend-sg_id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/${var.project_name}/${var.environment}/frontend-sg_id"
}

data "aws_ssm_parameter" "ansible_sg_id" {
  name  = "/${var.project_name}/${var.environment}/ansible-sg_id"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project_name}/${var.environment}/public"
}
data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.project_name}/${var.environment}/private"
}
data "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.project_name}/${var.environment}/database"
}



data "aws_ami" "expense" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
     name = "name"
     values =  ["RHEL-9-DevOps-Practice"]   
  }
 



  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



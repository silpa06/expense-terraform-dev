data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project_name}/${var.environment}/public"
}

data "aws_ssm_parameter" "sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion-sg_id"
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

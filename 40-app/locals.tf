locals {
  ami = data.aws_ami.expense.id
  resource_name    = "${var.project_name}-${var.environment}"
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_id.value)[0]
  private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_id.value)[0]
  database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_id.value)[0]
  mysql_sg_id      = data.aws_ssm_parameter.mysql_sg_id.value
  backend_sg_id    = data.aws_ssm_parameter.backend_sg_id.value
  frontend_sg_id   = data.aws_ssm_parameter.frontend_sg_id.value
  ansible_sg_id    = data.aws_ssm_parameter.ansible_sg_id.value
}

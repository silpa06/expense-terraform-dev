module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-bastion"
  ami = data.aws_ami.expense.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [local.sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge (
    var.common_tags,
    var.bastion_tags,
    {
      Name = "${local.resource_name}-bastion"
    }
  )
}
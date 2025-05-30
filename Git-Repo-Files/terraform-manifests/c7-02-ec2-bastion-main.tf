module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"
  
  name = "bastion-machine"

  ami                    = data.aws_ami.bastion_ami.id
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  
  tags = local.common_tags
  
}
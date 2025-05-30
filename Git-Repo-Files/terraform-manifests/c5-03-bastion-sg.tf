module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"
  
  name        = "bastion-host-sg"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp"]

  egress_rules = ["all-all"]
  tags = local.common_tags

}
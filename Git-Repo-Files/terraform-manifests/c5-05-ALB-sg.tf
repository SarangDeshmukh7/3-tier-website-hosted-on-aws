module "security-group-lb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "security-group-ALB"
  description = "Security group for ALB with HTTP and HTTPS ports open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp", "https-443-tcp"]

  egress_rules = ["all-all"]
  tags = local.common_tags

}


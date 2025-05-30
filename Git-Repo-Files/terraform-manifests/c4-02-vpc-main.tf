module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs               = var.vpc_avaliabilty_zone
  private_subnets   = var.private_subnets
  public_subnets    = var.public_subnets
  database_subnets  = var.database_subnets

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.environment
  }

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }

}


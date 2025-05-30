variable "vpc_name" {
    description = "Name of VPC"
    type = string
    default = "Prod-VPC"
}

variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_avaliabilty_zone" {
    description = "Avaiability Zone"
    type = list(string)
    default = [ "us-east-1a", "us-east-1b" ]
}

variable "private_subnets" {
    description = "private subnet CIDR range"
    type = list(string)
    default = [ "10.0.101.0/24", "10.0.102.0/24" ]
}

variable "public_subnets" {
    description = "public subnet CIDR range"
    type = list(string)
    default = [ "10.0.201.0/24", "10.0.202.0/24" ]
}

variable "database_subnets" {
    description = "database subnet CIDR range"
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}


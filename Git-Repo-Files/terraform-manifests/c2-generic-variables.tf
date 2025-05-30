variable "aws_region" {
  description = "aws region name"
  type = string
  default = "us-east-1"
}

variable "environment" {
    description = "enviroment name"
    type = string
    default = "Prod"
}

variable "business_divsion" {
  description = "business divsion"
  type = string
  default = "DevOps"
}
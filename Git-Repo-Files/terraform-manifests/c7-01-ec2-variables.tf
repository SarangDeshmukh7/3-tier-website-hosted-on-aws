variable "instance_type" {
    description = "Type of EC2 instance"
    type = string
    default = "t2.micro"
}

variable "instance_keypair" {
    description = "access key"
    type = string
    default = "Terraform-key"
  
}



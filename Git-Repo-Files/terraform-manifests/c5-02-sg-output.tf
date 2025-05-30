output "security_group_arn" {
  description = "The ARN of the security group"
  value       = module.public_bastion_sg.security_group_arn
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = module.public_bastion_sg.security_group_name
}

output "security_group_arn_private" {
  description = "The ARN of the security group"
  value       = module.private_sg.security_group_arn
}

output "security_group_id_private" {
  description = "The ID of the security group"
  value       = module.private_sg.security_group_id
}

output "security_group_name_private" {
  description = "The name of the security group"
  value       = module.private_sg.security_group_name
}

output "security_group_id_ALB" {
  description = "The name of the security group"
  value       = module.security-group-lb.security_group_id
}
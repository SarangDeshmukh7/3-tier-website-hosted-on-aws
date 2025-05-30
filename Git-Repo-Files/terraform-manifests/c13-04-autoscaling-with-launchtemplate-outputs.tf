output "launch_template_id" {
    description = "Launch Template ID"
    value = aws_launch_template.ec2_private.id
}

output "launch_template_version" {
    description = "Launch Template Lastest Version"
    value = aws_launch_template.ec2_private.latest_version
}

# autoscaling_group_id
output "autoscaling_group_id" {
    description = "Autoscaling Group ID"
    value = aws_autoscaling_group.main_app_instance_asg.id 
}

# autoscaling_group_name
output "autoscaling_group_name" {
    description = "Autoscaling Group Name"
    value = aws_autoscaling_group.main_app_instance_asg.name 
}
# autoscaling_group_arn
output "autoscaling_group_arn" {
    description = "Autoscaling Group ARN"
    value = aws_autoscaling_group.main_app_instance_asg.arn 
}
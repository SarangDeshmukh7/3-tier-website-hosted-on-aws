resource "aws_autoscaling_schedule" "during_business_hours" {
  scheduled_action_name  = "during-buisness-hours"
  min_size               = 1
  max_size               = 10
  desired_capacity       = 2
  start_time             = "2030-12-11T09:00:00Z"
  recurrence             = "00 09 * * *"
  autoscaling_group_name = aws_autoscaling_group.main_app_instance_asg.id
}

resource "aws_autoscaling_schedule" "after_business_hours" {
  scheduled_action_name  = "after-buisness-hours"
  min_size               = 1
  max_size               = 10
  desired_capacity       = 1
  start_time             = "2030-12-11T22:00:00Z"
  recurrence             = "00 21 * * *"
  autoscaling_group_name = aws_autoscaling_group.main_app_instance_asg.id
}
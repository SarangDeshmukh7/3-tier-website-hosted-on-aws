resource "aws_sns_topic" "ASG_notification" {
  name = "PROD-asg-topic"
}

resource "aws_sns_topic_subscription" "sns-topic-subscription" {
  topic_arn = aws_sns_topic.ASG_notification.arn
  protocol  = "email"
  endpoint  = "deshmukhsarang1998@gmail.com"
}

resource "aws_autoscaling_notification" "example_notifications" {
  group_names = [aws_autoscaling_group.main_app_instance_asg.id]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.ASG_notification.arn
}

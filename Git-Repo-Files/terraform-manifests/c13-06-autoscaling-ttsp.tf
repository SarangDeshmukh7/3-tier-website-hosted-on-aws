resource "aws_autoscaling_policy" "avg_cpu_utilization_greater_than_50" {
  depends_on = [module.alb]
  name                   = "avg-cpu-utilization-greater-than-50"
  autoscaling_group_name = aws_autoscaling_group.main_app_instance_asg.id
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120 # defaults to ASG default cooldown 300 seconds if not set  
  
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }

}

/*resource "aws_autoscaling_policy" "alb_target_requests_greater_than_10" {
  depends_on = [module.alb]
  name = "alb-target-requests-greater-than-10"
  policy_type = "TargetTrackingScaling" 
  autoscaling_group_name = aws_autoscaling_group.main_app_instance_asg.id
  estimated_instance_warmup = 120  
  # Number of requests > 10 completed per target in an Application Load Balancer target group.
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label = "${module.alb.load_balancer_arn_suffix}/${module.alb.target_groups["mytg1"].arn_suffix}"
    }  
    target_value = 10.0
  }    
}*/
resource "aws_autoscaling_group" "main_app_instance_asg" {
  desired_capacity   = 2
  max_size           = 10
  min_size           = 2

  vpc_zone_identifier = module.vpc.private_subnets
  
  ############################################################
  target_group_arns = [module.alb.target_groups["mytg1"].arn]
  ############################################################
  
  health_check_type = "EC2"


  launch_template {
        id = aws_launch_template.ec2_private.id 
        version = aws_launch_template.ec2_private.latest_version
    }
  
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50            
    }
    triggers = [ "desired_capacity" ]
  }


}
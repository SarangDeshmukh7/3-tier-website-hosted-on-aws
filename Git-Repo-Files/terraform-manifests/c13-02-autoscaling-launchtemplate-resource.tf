resource "aws_launch_template" "ec2_private" {
  name = "ec2-private"
  description = "Launch template for ec2 private instances via ASG"

  ebs_optimized = true 
  #default_version = 1
  update_default_version = true 
  
  image_id = data.aws_ami.bastion_ami.id
  key_name = var.instance_keypair

  instance_type = var.instance_type
  vpc_security_group_ids = [ module.private_sg.security_group_id ]
  user_data = filebase64("${path.module}/app1-install.sh")


  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
      delete_on_termination = true
    }
  }

  monitoring {
    enabled = true
  }   

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ec2-launch-template"
    }
  }

}
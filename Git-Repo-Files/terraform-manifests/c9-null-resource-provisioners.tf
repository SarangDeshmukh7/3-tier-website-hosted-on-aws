resource "null_resource" "null_resource_bastion" {
  
  depends_on = [ module.ec2_bastion ]

  connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/Terraform-key.pem") 
  }

  provisioner "file" {
        source = "private-key/Terraform-key.pem"
        destination = "/tmp/Terraform-key.pem"
  }

  provisioner "remote-exec" {
        inline = [
        "echo 'Changing key permission'",
        "sudo chmod 400 /tmp/Terraform-key.pem"
        ]

  }

/*  provisioner "local-exec" {
        command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
        working_dir = "local-exec-output-files/"
        #on_failure = continue
  }
*/

}

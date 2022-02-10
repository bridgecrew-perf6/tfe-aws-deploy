
resource "aws_instance" "tfe-01" {
  ami           = var.AMI_ID
  instance_type = "t2.micro"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "50"
    delete_on_termination = "true"
  }

  # the VPC subnet
 #subnet_id = aws_subnet.main-public-01.id
  subnet_id = module.vpc.public_subnets[0]

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = "tfe-deploy"

  connection {
    type = "ssh"
    user = "ubuntu"
    host = self.public_ip
    private_key = file("keys/tfe-deploy.pem")
  }

#  provisioner "file" {
#     source      = "../scripts/updates.sh"
#     destination = "/tmp/updates.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/updates.sh",
#       "sudo /tmp/updates.sh"
#     ]
#   }

  tags = {
      Name      = "tfe-01"
      proj      = "tfe-deploy"
  }


}

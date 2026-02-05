resource "aws_instance" "devops" {
  ami                         = "ami-0532be01f26a3de55"
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.ec2_sg]
  key_name                    = aws_key_pair.devops_keypair.key_name
  associate_public_ip_address = true

    user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              systemctl start docker
              systemctl enable docker
              docker run -d -p 1337:1337 shwetaraut815/strapi-app:latest
              EOF

  tags = {
    Name = "auto-ec2"
  }
}

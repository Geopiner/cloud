resource "aws_instance" "public_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name      = var.key_name
  associate_public_ip_address = true
  
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

    user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo '<h1>Nginx is live on public instance!</h1>' | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private.id
  key_name      = var.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

    user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo '<h1>Nginx is live on public instance!</h1>' | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "private-instance"
  }
}
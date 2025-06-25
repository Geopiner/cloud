resource "aws_instance" "web" {
  ami           = "ami-0b9dd1f70861d4721" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
  associate_public_ip_address = true
  key_name      = "George-key" # Ensure this key pair exists in your AWS account

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "day1-web-server"
  }
}

data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


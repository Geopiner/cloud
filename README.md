# George's Cloud Engineering Roadmap

Welcome to my step-by-step journey to becoming a Cloud Engineer.  
This repo documents all my progress, learnings, and hands-on labs with AWS and Terraform — starting from the fundamentals and building towards job-ready skills.

---

# Day 1: AWS Networking & EC2 Setup with Nginx

## Overview

Day 1 focuses on building a solid AWS networking foundation and launching your first EC2 instance with Nginx, all managed by Terraform and some manual hands-on steps.

---

## What You Built

- **VPC** with CIDR `10.0.0.0/16`  
- **Public subnet** with CIDR `10.0.1.0/24` in availability zone `eu-west-2a`  
- **Internet Gateway** attached to the VPC  
- **Route Table** routing all outbound traffic (`0.0.0.0/0`) to the IGW  
- **Security Group** allowing SSH (port 22) and HTTP (port 80) inbound traffic  
- **EC2 instance** (`t3.micro`) launched in the public subnet with:  
  - Public IP assigned  
  - Key pair for SSH access  
- **Manual Nginx installation** on EC2 with a custom HTML page  
- **Terraform outputs** configured to retrieve the EC2 public IP  
- **Terraform variables** introduced to make config reusable and flexible  
- **Git best practice**: excluded private SSH key from version control

---

## Commands & Tips

```bash
# Terraform commands
terraform init
terraform plan
terraform apply
terraform output instance_public_ip

# SSH into EC2 (replace path as needed)
ssh -i /path/to/george-key.pem ec2-user@$(terraform output -raw instance_public_ip)

# On the EC2 instance, manually install Nginx:
sudo yum update -y
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo '<h1>Nginx is live, George!</h1>' | sudo tee /usr/share/nginx/html/index.html
sudo systemctl reload nginx
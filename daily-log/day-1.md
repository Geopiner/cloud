# Day 1: AWS Networking & EC2 Setup with Nginx

## Goals

- Understand basic AWS networking components (VPC, subnet, internet gateway)  
- Launch a public EC2 instance with a key pair  
- Install and serve a custom Nginx web page manually  
- Start using Terraform variables for flexibility  
- Practice Git best practices around sensitive files  

---

## What I Did

- Created a VPC with CIDR block `10.0.0.0/16`  
- Set up a public subnet (`10.0.1.0/24`) in `eu-west-2a`  
- Attached an Internet Gateway to enable public internet access  
- Configured route tables to direct traffic to the Internet Gateway  
- Created a security group allowing SSH (22) and HTTP (80) access  
- Launched a `t3.micro` EC2 instance in the public subnet with a key pair  
- SSH’d into the instance and installed Nginx manually  
- Replaced the default Nginx welcome page with a custom HTML message  
- Added Terraform variables to parameterize AMI ID, instance type, and key name  
- Updated `.gitignore` to exclude private SSH keys and Terraform state files  
- Cleaned repo history to remove large Terraform provider binaries  

---

## Commands & Snippets

# Terraform commands
```bash
terraform init
terraform plan
terraform apply
terraform output instance_public_ip
```

# SSH into EC2 (replace path as needed)
```
ssh -i /path/to/george-key.pem ec2-user@$(terraform output -raw instance_public_ip)
```

# On the EC2 instance, manually install Nginx:
```
sudo yum update -y
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo '<h1>Nginx is live, George!</h1>' | sudo tee /usr/share/nginx/html/index.html
sudo systemctl reload nginx
```

## Notes & Lessons

- Remember to keep private keys and AWS credentials out of GitHub  
- Terraform state files and `.terraform` folders should be gitignored  
- Always verify security group rules to avoid connectivity issues  
- Using variables in Terraform makes configs reusable and cleaner  
- Removing large files from git history helps keep repo lean  
- Manual installs help understand the environment better before automating  

---

## Next Steps

- Deep dive into AWS networking concepts and subnet routing  
- Hands-on IAM user and role setup  
- Automate instance setup with user data scripts  
- Explore Terraform remote backends for state management  
- Begin AWS CLI advanced usage and scripting  

Day 1 Complete!
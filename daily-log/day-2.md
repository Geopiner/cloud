# 🛠️ Day 2 – VPC Networking, Subnets & Public EC2 Access

## ✅ Objectives Completed

- [x] Created a custom VPC (`10.0.0.0/16`)
- [x] Deployed public + private subnets across availability zones
- [x] Set up and attached an Internet Gateway (IGW)
- [x] Created a NAT Gateway for private subnet internet access
- [x] Configured route tables:
  - Public subnet routes `0.0.0.0/0` to IGW
  - Private subnet routes `0.0.0.0/0` to NAT Gateway
- [x] Defined separate security groups for public and private EC2 instances
- [x] Launched EC2 instance in public subnet via Terraform
- [x] Used `user_data` script to provision Nginx (fixed manually after silent failure)
- [x] Opened port 80 for web access from my IP
- [x] Verified successful Nginx setup in browser
- [x] Connected to EC2 via SSH with `.pem` key

---

## 💡 Lessons Learned

- `user_data` runs only once and silently fails if no internet access is available
- You **must** attach an IGW and update route tables for public access
- NAT Gateway + Elastic IP is essential for outbound internet from private subnet
- Cloud-init logs are gold for debugging EC2 provisioning:
  ```bash
  cat /var/log/cloud-init-output.log
  ```

I spent a couple hours trying to figure out why I couldn't SSH to the EC2, turns out I just didn't add the rule to the SG!

Day 2 Completed - Brain Cooked
# Terraform AWS NGINX Deployment

🚀 **Modular Terraform project** to deploy an HTML page on **NGINX** with AWS, fully automated and ready for CI/CD.

---

## 🧩 Project Overview

This project demonstrates:

- Modular **Terraform architecture**  
- **AWS VPC**, subnet, route table, and security group configuration  
- **EC2 deployment** with NGINX and a custom HTML page  
- **S3 backend with lockfile** for Terraform state (Terraform 1.10+)  
- **GitHub Actions CI/CD pipeline** for automated deployment  

Perfect for showcasing **Infrastructure as Code (IaC)** skills on LinkedIn.

---

## 🌐 Architecture
Internet
|
v
[IGW] --- [Route Table] --- [Public Subnet]
|
v
[EC2 Instance]
|
v
NGINX
|
v
HTML Page Served


---

## 🛠️ Features

- **Modular Terraform structure**
  - `vpc`, `subnet`, `igw`, `route_table`, `security_group`, `ec2`
- **External HTML page**
  - Easily replaceable in `html/index.html`
- **Secure AWS Networking**
  - Public subnet with security group allowing HTTP/SSH
- **CI/CD with GitHub Actions**
  - Automatically runs `terraform init`, `validate`, `plan`, and `apply` on push

---

## 📁 Project Structure
terraform-aws-nginx/
│
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
├── backend.tf
├── html/
│ └── index.html
└── modules/
├── vpc/
├── subnet/
├── igw/
├── route_table/
├── security_group/
└── ec2/


---

## ⚡ Deployment Instructions

### 1. Pre-requisites

- Terraform **1.10+**  
- AWS CLI configured  
- EC2 key pair created in AWS

### 2. Configure GitHub Secrets (for CI/CD)

Add the following to **GitHub Secrets**:

| Secret Name | Description |
|------------|-------------|
| `AWS_ACCESS_KEY_ID` | Your AWS access key |
| `AWS_SECRET_ACCESS_KEY` | Your AWS secret key |
| `KEY_NAME` | Your EC2 key pair name |

---

### 3. Terraform Commands

```bash
# Initialize Terraform with S3 backend lockfile
terraform init -backend-config="lockfile=true"

# Validate configuration
terraform validate

# Check formatting
terraform fmt -check

# Plan infrastructure
terraform plan -var="key_name=your-key-name"

# Apply changes
terraform apply -auto-approve -var="key_name=your-key-name"

4. Access the Website

After apply:

http://<EC2_PUBLIC_IP>

5. SSH Access (Optional)
ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>

📦 GitHub Actions CI/CD
Automatically runs on push to main or pull request
Steps:
Checkout code
Setup Terraform 1.10+
Configure AWS credentials
Terraform init, validate, plan
Auto apply on main branch


🎯 Key Learnings
Modular Terraform design
S3 backend with lockfile (Terraform 1.10+)
Infrastructure automation with GitHub Actions
Networking fundamentals: VPC, subnets, IGW, route tables
Deploying NGINX and custom HTML content

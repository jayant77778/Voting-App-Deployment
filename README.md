
# 🗳️ Terraform Voting App Deployment

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Container-2496ED?logo=docker&logoColor=white)
![EC2](https://img.shields.io/badge/EC2-Instance-FF9900?logo=amazon-aws&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Overview

This project deploys the classic **Docker Voting App** (Cats 🐱 vs Dogs 🐶) on **AWS EC2** using **Terraform**.  
It demonstrates **Infrastructure as Code (IaC)** with Terraform, provisioning AWS infrastructure, and deploying a **multi-container application** with Docker Compose.

---

## 📊 Architecture Flow

```mermaid
flowchart TD
    A[Terraform Init/Apply] --> B[VPC + Subnet + Security Groups]
    B --> C[EC2 Instance]
    C --> D[User Data Script]
    D --> E[Install Docker & Docker Compose]
    E --> F[Run Docker Voting App]
    F --> G[Vote UI :5000]
    F --> H[Result UI :5001]
    F --> I[Redis + Worker + Postgres]
````

---

## ⚡ Prerequisites

* ✅ AWS Account + IAM user with **EC2, VPC, S3** permissions
* ✅ [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
* ✅ AWS CLI configured (`aws configure`)

---

## 🚀 Deployment Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/jayant77778/Voting-App-Deployment.git
   cd Voting-App-Deployment
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Preview the infra changes**

   ```bash
   terraform plan
   ```

4. **Apply changes**

   ```bash
   terraform apply -auto-approve
   ```

5. **Access the App**

   * Voting App → `http://<EC2-Public-IP>:5000`
   * Results App → `http://<EC2-Public-IP>:5001`

---

## 📂 Project Structure

```
terraform-voting-app/
├── backend.tf        # S3 backend config (for remote state)
├── provider.tf       # AWS provider config
├── variables.tf      # Input variables
├── vpc.tf            # VPC, Subnet setup
├── security.tf       # Security group rules
├── ec2.tf            # EC2 instance config
├── output.tf         # Terraform outputs (EC2 public IP)
├── user-data.sh      # Bootstrap script (installs Docker + runs voting app)
└── .gitignore        # Ignore sensitive files (tfstate, .terraform, etc.)
```

---

## 🛑 Cleanup

To destroy everything:

```bash
terraform destroy -auto-approve
```

---

## 🌟 Key Learnings

* ☁️ **Terraform** → Reproducible & scalable infra
* 🐳 **Docker Compose** → Multi-container deployment made simple
* ⚡ **AWS EC2** → Hosting containerized apps
* 🔁 **IaC lifecycle** → init → plan → apply → destroy



## 👨‍💻 Author

**Jayant Bhati**
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin)](https://www.linkedin.com/in/jayantbhati77/)
[![GitHub](https://img.shields.io/badge/GitHub-Repos-black?logo=github)](https://github.com/jayant77778)

---

```




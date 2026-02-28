# DevOps Deployment Project
### Terraform + Ansible + Docker + GitHub Actions CI/CD on AWS EC2

This project demonstrates a complete **DevOps automation workflow** that provisions infrastructure, configures a server, deploys a Dockerized web application, and automates deployment using a CI/CD pipeline.

The system automatically rebuilds and redeploys the application whenever new code is pushed to the GitHub repository.

---

# Project Overview

This project implements a modern DevOps pipeline using the following tools:

- **Terraform** – Infrastructure provisioning using Infrastructure as Code
- **Ansible** – Configuration management and server automation
- **Docker** – Containerization of the web application
- **GitHub Actions** – Continuous Integration and Continuous Deployment (CI/CD)
- **AWS EC2** – Cloud infrastructure hosting the application

The goal of this project is to automate the entire deployment lifecycle from infrastructure creation to application deployment.

---

# DevOps Workflow

The automated pipeline works as follows:

Developer pushes code to GitHub
↓
GitHub Actions CI/CD Pipeline triggers
↓
Docker image is built automatically
↓
Image pushed to GitHub Container Registry (GHCR)
↓
GitHub Actions connects to EC2 via SSH
↓
Docker container updated on EC2
↓
Updated application deployed automatically


This ensures that the latest version of the application is always deployed with minimal manual intervention.

---

# Project Structure
devops-deployment
│
├── ansible
│ ├── inventory.ini
│ └── playbook.yml
│
├── app
│ ├── Dockerfile
│ └── index.html
│
├── terraform
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── .github
│ └── workflows
│ └── ci-cd.yml
│
├── .gitignore
└── README.md

---

# Infrastructure Provisioning (Terraform)

Terraform is used to provision the AWS infrastructure required for the project.

Resources created:

- AWS EC2 Instance
- Security Group
- SSH Key Pair

### Steps to deploy infrastructure

Navigate to the Terraform directory:

```
cd terraform
```
Initialize Terraform:
``` terraform init ```
Preview the infrastructure plan:
```terraform plan```
Apply the configuration to create the resources:
```terraform apply```
After successful execution, Terraform outputs the public IP address of the EC2 instance.

# Server Configuration (Ansible)

Ansible is used to automate server configuration and application deployment.

The playbook performs the following tasks:

-Updates system packages

-Installs Docker

-Starts and enables Docker service

-Creates application directory

-Copies application files

-Builds Docker image

-Runs Docker container on port 80

Run the Ansible Playbook

Navigate to the Ansible folder:
```cd ansible```
Run the playbook:
```ansible-playbook -i inventory.ini playbook.yml```

# Docker Container

The web application is containerized using Docker.

The Dockerfile:

-Uses Ubuntu as the base image

-Installs Nginx

-Copies the web application files

-Exposes port 80

-Runs the web server

Example Docker commands

Build Docker image:
```docker build -t custom-webapp .```
Run the container:
```docker run -d -p 80:80 custom-webapp```

# CI/CD Pipeline (GitHub Actions)

GitHub Actions automates the build and deployment process.

The pipeline performs the following steps:

-Trigger pipeline when code is pushed to the main branch

-Build the Docker image

-Push the image to GitHub Container Registry (GHCR)

-Connect to EC2 using SSH

-Pull the latest Docker image

-Restart the container with the updated version

Pipeline configuration file:
```.github/workflows/ci-cd.yml```

# Deployment

After the CI/CD pipeline runs successfully, the application is deployed automatically.

Access the application using the EC2 public IP address:
```http://<EC2_PUBLIC_IP>```

# CI/CD Demonstration

To demonstrate the CI/CD pipeline:

1. Modify the web application (e.g., edit index.html)

2. Push the changes to GitHub

```
git add .
git commit -m "Update web page"
git push 
```
3. GitHub Actions automatically triggers the CI/CD pipeline.

4. The updated Docker container is deployed to AWS EC2.

# Security Considerations
Sensitive files are excluded using .gitignore, including:

1.Terraform state files

2. Terraform working directories

3. SSH private keys

4. System generated files

This ensures that sensitive data is not pushed to the GitHub repository.

# Author

Rohit Sasidharan

DevOps Deployment Project
Terraform • Ansible • Docker • GitHub Actions • AWS EC2

DevOps Deployment Project
Terraform + Ansible + Docker + GitHub Actions CI/CD on AWS EC2

This project demonstrates a complete DevOps automation workflow that provisions infrastructure, configures a server, deploys a Dockerized web application, and automates deployment using a CI/CD pipeline.

The system automatically rebuilds and redeploys the application whenever new code is pushed to the GitHub repository.

Project Architecture

The project integrates the following DevOps tools:

Terraform – Infrastructure as Code (IaC) to provision AWS EC2

Ansible – Configuration management and server setup

Docker – Containerization of the web application

GitHub Actions – Continuous Integration and Continuous Deployment (CI/CD)

AWS EC2 – Cloud infrastructure hosting the application

DevOps Workflow

The automated workflow is shown below:

Developer pushes code to GitHub
        ↓
GitHub Actions CI/CD Pipeline
        ↓
Docker image is built
        ↓
Image pushed to GitHub Container Registry (GHCR)
        ↓
GitHub Actions connects to EC2 via SSH
        ↓
Docker container updated on EC2
        ↓
Updated application deployed automatically

Project Structure
devops-deployment
│
├── ansible
│   ├── inventory.ini
│   └── playbook.yml
│
├── app
│   ├── Dockerfile
│   └── index.html
│
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── .github
│   └── workflows
│       └── ci-cd.yml
│
└── README.md

Infrastructure Provisioning (Terraform)

Terraform is used to create and manage the AWS infrastructure.

The following resources are provisioned:

AWS EC2 Instance

Security Group

SSH Key Pair

To deploy the infrastructure:

cd terraform
terraform init
terraform plan
terraform apply

Terraform outputs the public IP address of the EC2 instance after deployment.

Server Configuration (Ansible)

Ansible automates server configuration and application deployment.

The playbook performs the following tasks:

Updates system packages

Installs Docker

Starts and enables Docker service

Copies application files

Builds Docker image

Runs Docker container on port 80

To run the Ansible playbook:

cd ansible
ansible-playbook -i inventory.ini playbook.yml
Docker Container

The web application is containerized using Docker.

The Dockerfile:

Uses Ubuntu as the base image

Installs Nginx

Copies the web application files

Exposes port 80

CI/CD Pipeline (GitHub Actions)

GitHub Actions is used to automate the build and deployment process.

The pipeline performs the following steps:

Trigger pipeline when code is pushed to the main branch

Build the Docker image

Push the image to GitHub Container Registry (GHCR)

Connect to EC2 using SSH

Pull the latest Docker image

Restart the container with the updated version

Pipeline configuration file:

.github/workflows/ci-cd.yml
Deployment

Once the pipeline completes successfully, the application becomes available at:

http://<EC2_PUBLIC_IP>

CI/CD Demonstration

To demonstrate the pipeline:

Modify the web application (e.g., edit index.html)

Push changes to GitHub

git add .
git commit -m "Update webpage"
git push

GitHub Actions automatically triggers the pipeline

The updated container is deployed to AWS EC2

Security Considerations

Sensitive files are excluded using .gitignore, including:

Terraform state files

SSH private keys

Terraform working directories

Author

Rohit Sasidharan

DevOps Deployment Project
Terraform • Ansible • Docker • GitHub Actions • AWS EC2

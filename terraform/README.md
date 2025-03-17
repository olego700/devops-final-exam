# Terraform Setup
This folder contains Terraform code to provision an AWS EC2 instance named "oleg_builder" with Docker and Docker Compose installed.

## Implemented
- EC2 instance in us-east-1
- SSH key pair generation and security group configuration.

## How to Run
1. Install Terraform.
2. Run `terraform init` in this folder.
3. Run `terraform apply`.
4. SSH into the instance: `ssh -i builder_key.pem ubuntu@<PUBLIC_IP>`.

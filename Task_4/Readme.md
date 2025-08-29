# XOps Microchallenge #4 – Terraform + Ansible Web App
 
## Overview
Provision an AWS EC2 instance with Terraform, then configure and deploy a web app using Ansible.
 
## Prerequisites
- AWS account & credentials
- Terraform installed
- Ansible installed
- SSH key pair for EC2
 
## Steps
 
### 1. Provision EC2 with Terraform
```
terraform init
terraform apply
```
Note the public IP output.
 
### 2. Configure with Ansible
- Edit `inventory` and replace with your EC2 public IP and private key path.
- Run:
```
ansible-playbook -i inventory site.yml
```
 
### 3. Test Web App
- Open browser: `http://<EC2_PUBLIC_IP>`
 
### 4. Cleanup
```
terraform destroy
```
Terminate EC2 to avoid charges.
 
## Screenshots
Below are example screenshots placed in the `screenshots/` folder:
 
### EC2 WEBPAGE
<img width="1919" height="1006" alt="Screenshot 2025-08-28 112228" src="https://github.com/user-attachments/assets/a90156cb-3eb8-4800-9745-f999eb39cf1e" />
 
### Ansible Run Output
<img width="1919" height="1006" alt="Screenshot 2025-08-28 112228" src="https://github.com/user-attachments/assets/6eb8a9e0-6927-48e8-ac7e-a41a294ea2f1" />
 
## Files
- `main.tf` – Terraform infra
- `inventory` – Ansible host file
- `site.yml` – Ansible playbook
- `index.html` – Web content
- `README.md` – Setup instructions

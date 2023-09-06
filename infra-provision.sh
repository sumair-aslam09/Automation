#!/bin/bash

# Define the paths to your Python, Terraform, and Ansible files
#PYTHON_SCRIPT="/python/generate.py"
TERRAFORM_DIR="/terraform/"
ANSIBLE_PLAYBOOK="/ansible/ansible.yaml"
ANSIBLE_DIR="/ansible/"


# Execute the Python script
echo "Executing Python script..."
#py "$PYTHON_SCRIPT"
python3 /python/generate.py
if [ $? -ne 0 ]; then
  echo "Python script execution failed."
  #exit 1
fi



# Execute Terraform
echo "Executing Terraform..."
cd "$TERRAFORM_DIR"
terraform init
terraform apply -auto-approve
if [ $? -ne 0 ]; then
  echo "Terraform execution failed."
  #exit 1
fi

 # Copy the terraform.tfstate file to the Ansible directory
cp terraform.tfstate "$ANSIBLE_DIR"

# Execute Ansible
echo "Executing Ansible..."
ansible-playbook "$ANSIBLE_PLAYBOOK"
if [ $? -ne 0 ]; then
  echo "Ansible playbook execution failed."
  #exit 1
fi



echo "Script executed successfully."

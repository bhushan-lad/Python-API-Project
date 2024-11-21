#!/bin/bash

# Update package lists
sudo yum upgrade -y

# Install git
sudo yum install git -y

sudo yum install pip -y
# Clone the repository
git clone https://github.com/bhushan-lad/Python-API-Project.git

# Move into the project directory
cd Python-API-Project/

# Install Flask and boto3
pip install flask boto3
pip install flask
echo "Successfully installed dependencies!"

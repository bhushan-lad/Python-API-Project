# Python-API-Project

You'll find all the required files in this GitHub repository.

To start with
main.py : 
Written in Python to expose the API to list the bucket contents.
Please use your access and secret access keys from the AWS account. Same goes for the bucket name.
flask app will be available on port 5000, hence we have allowed the inbound rule in security group attached to EC2 instance.

main.tf :
It is a Terraform file to deploy the infrastructure and expose the API. 
main.tf needs the variables.tf file where we have defined the default values and referenced them in main.tf.
Replace all the default values in variables.tf with your own.

requirements.sh :
This file has all the commands that are going to execute in EC2. I've listed the commands in this file to install all the necessary packages.

Finally, please use your own.pem file to deploy the EC2 instance, and to connect to the same, I've used mykey.pem (which is not present in this repository).

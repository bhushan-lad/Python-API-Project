# Python-API-Project

You'll find all the required files in this github repository.

To start with
main.py : 
Written in python to expose the API to list the bucket contents.
Please use your access and secrect access keys from aws account. Same goes for the bucket name.
flask app will be available on port 5000, hence we have allowed the inbound rule in security group attached to ec2 instance.

main.tf :
It is a terraform file to deploy the infrastructure and to expose the api. 
main.tf needs the variables.tf file where we have defined the default values and referencing them in main.tf
Replace all the default values in variables.tf with your own.

requirements.sh :
this file has all the commands that are going to execute in ec2, I've listed the commands in this file to install all the necessary packages.



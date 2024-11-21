terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_security_group" "mysg" {
  name        = "allow_ssh_custom_ports"
  vpc_id      = var.vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "ingress_rule_ssh" {
security_group_id = aws_security_group.mysg.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
resource "aws_vpc_security_group_ingress_rule" "ingress_rule_app" {
security_group_id = aws_security_group.mysg.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 5000
  ip_protocol = "tcp"
  to_port     = 5000
}
resource "aws_vpc_security_group_egress_rule" "egress_all" {
  security_group_id = aws_security_group.mysg.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}

resource "aws_instance" "myec2" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = "mykey"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file ("./mykey.pem")
    host = self.public_ip
  }
    provisioner "file" {
    source      = "requirements.sh"
    destination = "/tmp/requirements.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/requirements.sh",
        "/tmp/requirements.sh",
    ]
  }
}


# Pulls Subnet Information
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Abdulaziz-19"
    workspaces = {
      name = "vpc"
    }
  }
}

# Finds Ubuntu AMI 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"] # Canonical
}
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Abdulaziz-19"
    workspaces = {
      name = "vpc"
    }
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "project_db_subnet_group"
  subnet_ids = [terraform_remote_state.vpc.outputs.private_subnets]
}
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
  name       = "main"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

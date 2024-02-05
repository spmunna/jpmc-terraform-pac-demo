provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-09f85944838b438c5" 
  instance_type = "t2.micro"

  tags = {
    Name = "jpmc-pac-ec2"
    env  = "development"
    team = "CTO-team-2"
  }
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "jpmc-pac-db"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"

  tags = {
    Name = "jpmc-pac-db"
    env  = "development"
    team = "CTO-team"
  }
}

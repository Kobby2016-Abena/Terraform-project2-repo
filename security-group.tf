# Create Security Group and open Port 80
resource "aws_security_group" "http-security-group" {
  name        = "HTTP Security Group"
  description = "Enable HTTP access on port 80"
  vpc_id      =  aws_vpc.vpc.id
  


  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "HTTP Security Group"
  }
}



# Create Security Group and open Port 22
resource "aws_security_group" "ssh-security-group" {
  name        = "SSH Security Group"
  description = "Enable SSH access on port 22"
  vpc_id      =  aws_vpc.vpc.id


  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh-location}"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH Security Group"
  }
}



# Create Security Group for the Web server
resource "aws_security_group" "webserver-security-group" {
  name        = "Web Server Security Group"
  description = "Enable HTTP access on port 80 via HTTP Security group and SSH on Port 22 via SSH security Group "
  vpc_id      =  aws_vpc.vpc.id


  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.http-security-group.id}"]
  }


  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.ssh-security-group.id}"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Web Server Security Group"
  }
}


# Create Security Group for the Database
resource "aws_security_group" "database-security-group" {
  name        = "Database Security Group"
  description = "Enable MYSQL access on port 3306"
  vpc_id      =  aws_vpc.vpc.id


  ingress {
    description      = "MYSQL Access"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.webserver-security-group.id}"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database Security Group"
  }
}







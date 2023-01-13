# create ec2 Instance 1
resource "aws_instance" "ec2_instance_1" {
  ami   = "ami-084e8c05825742534"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.web-public-subnet-1.id
  availability_zone = "eu-west-2a"
  key_name          = "Kwabena-KP"


  tags = {
    Name = "EC2 Instance 1"
  }
}



# create ec2 Instance 2
resource "aws_instance" "ec2_instance_2" {
  ami   = "ami-084e8c05825742534"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.app-private-subnet-1.id
  availability_zone = "eu-west-2a"
  key_name          = "Kwabena-KP"


  tags = {
    Name = "EC2 Instance 2"
  }
}



# Create Security Group for the ec2
resource "aws_security_group" "ec2_security_group" {
  name        = "EC2 Security Group"
  description = "Enable HTTP access on port 80 and and SSH on Port 22"
  vpc_id      =  aws_vpc.vpc.id


  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["140.228.49.181/32"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "EC2 Instance"
  }
}






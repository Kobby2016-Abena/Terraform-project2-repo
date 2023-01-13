variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type = string
}


variable "public-subnet-1-cidr" {
  default = "10.0.0.0/24"
  description = "Public Subnet 1 CIDR Block"
  type = string
}


variable "public-subnet-2-cidr" {
  default = "10.0.1.0/24"
  description = "Public Subnet 2 CIDR Block"
  type = string
}



variable "private-subnet-1-cidr" {
  default = "10.0.2.0/24"
  description = "Private Subnet 1 CIDR Block"
  type = string
}



variable "private-subnet-2-cidr" {
  default = "10.0.3.0/24"
  description = "Private Subnet 2 CIDR Block"
  type = string
}


variable "ssh-location" {
  default = "0.0.0.0/0"
  description = "IP Address That Can SSH Into The EC2 Instance"
  type = string
}



variable "database-snapshot-identifier" {
  default = "arn:aws:rds:eu-west-2:099685882910:snapshot:myrds"
  description = "The Database Snapshot ARN"
  type = string
}


variable "database-instance-class" {
  default = "db.t2.micro"
  description = "The Database Instance Type"
  type = string
}



variable "database-instance-identifier" {
  default = "kobby-1"
  description = "The Database Instance Identifier"
  type = string
}


variable "multi-az-deploment" {
  default = false
  description = "Create a Standby DB Instance"
  type = bool
}





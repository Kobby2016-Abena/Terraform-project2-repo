# Allocate elastic IP Address
resource "aws_eip" "eip-1" {
  vpc      = true

  tags = {
    Name = "EIP 1"
  }
}



# Create Nat Gateway 1 in Public Subnet 1
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-1.id
  subnet_id     = aws_subnet.web-public-subnet-1.id

  tags = {
    Name = "Nat Gateway Public Subnet 1"
  }
}


# Create Private Route Table 1 and Add Route Through Nat Gateway 1
resource "aws_route_table" "private-route-table-1" {
  vpc_id =  aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-1.id
  }

  tags = {
    Name = "Private Route Table 1"
  }
}



# Associate Private Subnet 1 with "Private Route Table 1"
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.app-private-subnet-1.id
  route_table_id = aws_route_table.private-route-table-1.id
}


# Associate Private Subnet 2 with "Private Route Table 1"
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.app-private-subnet-2.id
  route_table_id = aws_route_table.private-route-table-1.id
}











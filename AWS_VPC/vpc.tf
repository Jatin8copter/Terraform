resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/20"
  tags = {
    Name = "Tets-vpc"
  }
}

resource "aws_vpc" "prod_vpc" {
  cidr_block = "11.0.0.0/20"
  tags = {
    Name = "Prod-vpc"
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "Test_igw"
  }
}

resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    Name = "Prod_igw"
  }
}


resource "aws_subnet" "test-public-subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "Test-public-subnet"
  }
}

resource "aws_subnet" "prod-public-subnet" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "11.0.0.0/24"
  tags = {
    Name = "Prod-public-subnet"
  }
}

resource "aws_route_table" "test-rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    gateway_id = aws_internet_gateway.test_igw.id
    cidr_block = "0.0.0.0/0"
  }
    route {
    vpc_peering_connection_id = aws_vpc_peering_connection.test-prod-peering.id
    cidr_block = "11.0.0.0/20"
  }
  tags = {
    Name="Test-rt"
  }
}

resource "aws_route_table" "prod-rt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    gateway_id = aws_internet_gateway.prod_igw.id
    cidr_block = "0.0.0.0/0"
  }
    route {
    vpc_peering_connection_id = aws_vpc_peering_connection.test-prod-peering.id
    cidr_block = "10.0.0.0/20"
  }
  tags = {
    Name="Prod-rt"
  }
}

resource "aws_route_table_association" "test-rt-association" {
    subnet_id = aws_subnet.test-public-subnet.id
    route_table_id = aws_route_table.test-rt.id
}

resource "aws_route_table_association" "prod-rt-association" {
    subnet_id = aws_subnet.prod-public-subnet.id
    route_table_id = aws_route_table.prod-rt.id
}
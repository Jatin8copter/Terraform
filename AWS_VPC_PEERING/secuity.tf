resource "aws_security_group" "test-sg" {
  vpc_id = aws_vpc.test_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port=-1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["11.0.0.0/20"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "prod-sg" {
  vpc_id = aws_vpc.prod_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

    ingress {
    from_port=-1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/20"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
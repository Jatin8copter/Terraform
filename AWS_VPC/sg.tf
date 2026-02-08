resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "-1"
    from_port = "0"
    to_port = "0"
  }

  tags = {
    Name = "allow_tls"
  }
}
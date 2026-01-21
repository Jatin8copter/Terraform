resource "aws_instance" "test-server" {
  ami = var.ami_id
  instance_type = var.inst_type
  subnet_id = aws_subnet.test-public-subnet.id
  associate_public_ip_address = true
  tags = {
    Name="Test-Server"
  }
vpc_security_group_ids =  [ aws_security_group.test-sg.id]
}


resource "aws_instance" "prod-server" {
  ami = var.ami_id
  instance_type = var.inst_type
  subnet_id = aws_subnet.prod-public-subnet.id
  associate_public_ip_address = true
  tags = {
    Name="Prod-Server"
  }
  vpc_security_group_ids =  [ aws_security_group.prod-sg.id]
}
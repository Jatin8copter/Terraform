resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("./mykey.pub")
}

resource "aws_instance" "example" {
  ami                         = "ami-06e3c045d79fd65d9"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  tags = {
    Name = "HelloWorld"
  }
}
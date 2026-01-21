output "test-inst-private-ip" {
  value = aws_instance.test-server.private_ip
}

output "prod-inst-private-ip" {
  value = aws_instance.prod-server.private_ip
}
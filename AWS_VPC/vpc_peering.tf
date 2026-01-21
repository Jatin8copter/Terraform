resource "aws_vpc_peering_connection" "test-prod-peering" {
  peer_vpc_id   = aws_vpc.test_vpc.id
  vpc_id        = aws_vpc.prod_vpc.id
  auto_accept = true
  tags = {
    Name="Test-Prod-peering"
  }
}
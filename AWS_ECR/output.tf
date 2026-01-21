output "ecr_uri" {
  value = aws_ecr_repository.ecr-repo.repository_url
}
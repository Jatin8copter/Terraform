resource "aws_ecr_repository" "ecr-repo" {
  name = "my-repo"
  image_tag_mutability = "MUTABLE"
}
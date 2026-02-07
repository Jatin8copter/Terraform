resource "random_id" "name" {
  byte_length = 8
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-test-bucket-${random_id.name.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_object" "html" {
  key        = "index.html"
  bucket     = aws_s3_bucket.my_bucket.id
  source     = "./index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  key        = "style.css"
    bucket     = aws_s3_bucket.my_bucket.id
  source     = "./style.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = jsonencode(
    {
    Version= "2012-10-17",		 	 	 
    Statement= [
        {
            Sid= "PublicReadGetObject",
            Effect= "Allow",
            Principal= "*",
            Action="s3:GetObject"
            Resource="arn:aws:s3:::my-tf-test-bucket-a309df738a987172/*"
        }
    ]
}
  )
}
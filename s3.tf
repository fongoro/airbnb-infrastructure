resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-testfay-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
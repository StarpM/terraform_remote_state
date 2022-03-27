provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = "eu-west-1"
}

resource "aws_s3_bucket" "tf_course" {

  bucket = "argtes-remote-state-bucket"
  tags = {
    "terraform-driven" = "true",
    "cost-project"     = "terraform-bootcamp"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.tf_course.id
  acl    = "private"
}

# Configure the AWS Provider
provider "aws" {
  region  = "ca-central-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "pn-tf-state"
    key    = "deckspn"
    region = "ca-central-1"
  }
}

resource "aws_s3_bucket" "deckspn" {
  # Bucket name must match the DNS it will be CNAME'd from
  # https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html
  bucket = "decks.pierre-nick.com"
  acl    = "public-read"

  website {
      index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "deckspn_policy" {
  bucket = "${aws_s3_bucket.deckspn.id}"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.deckspn.bucket}/*"
    }
  ]
}
POLICY
}

output "Domain to CNAME" {
  value = "${aws_s3_bucket.deckspn.website_endpoint}"
}

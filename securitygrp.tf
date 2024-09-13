######pull-request####################
###addedline2######
provider "aws" {
region = "ap-south-1"
}

resource "aws_s3_bucket" "example13092024" {
  bucket = "my-tf-test-bucket13092024"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_security_group" "http-sg" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

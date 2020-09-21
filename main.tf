terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_s3_bucket" "strukbucket" {
  bucket = "strukbucket"
  acl = "public-read"
  region = "eu-central-1"
  force_destroy = true
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    Name        = "strukbucket"
    Environment = "Dev"
  }
  provisioner "local-exec" {
    command = "ansible-playbook site.yml"
  }
}
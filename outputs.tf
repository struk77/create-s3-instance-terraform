output "address" {
    description = "S3 bucket address"
    value = "${aws_s3_bucket.strukbucket.bucket_domain_name}"
}
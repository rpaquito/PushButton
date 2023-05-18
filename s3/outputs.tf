output "s3_arn" {
  description = "The S3 ARN"
  value = "${aws_s3_bucket.s3_bucket_files.arn}"
}

output "s3_name" {
  description = "The S3 Name"
  value = "${aws_s3_bucket.s3_bucket_files.id}"
}
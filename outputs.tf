output "s3_arn" {
  description = "S3 ARN"
  value       = "${module.s3_bucket.s3_arn}"
}
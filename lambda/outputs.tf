output "lambda_arn" {
  description = "The lambda ARN"
  value = aws_lambda_function.process_file_lambda.arn
}
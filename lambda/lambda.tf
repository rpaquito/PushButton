# The Lambda function for masm
resource "aws_lambda_function" "process_file_lambda" {
  filename         = "./tmp/processFile.zip"
  function_name    = "${var.deploy_name}-process-file"
  role             = aws_iam_role.lambda_role.arn
  handler          = "processFile.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.6"
  timeout          = 5

  environment {
    variables = {
      MAX_LINES = "${var.max_lines}"
      REGION    = "${var.aws_region}"
    }
  }
}

# Data for archiving lambda script
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/src/processFile.py"
  output_path = "./tmp/processFile.zip"
}

# Lambda role
resource "aws_iam_role" "lambda_role" {
  name               = "${var.deploy_name}-process-file-lambda-role"
  assume_role_policy = file("${path.module}/lambda_role.json")
}

# Lambda role policy
resource "aws_iam_role_policy" "lambda_role_policy" {
  name   = "${var.deploy_name}-process-file-role-policy"
  role   = aws_iam_role.lambda_role.name
  policy = file("${path.module}/lambda_role_policy.json")
}
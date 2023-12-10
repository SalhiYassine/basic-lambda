provider "aws" {
  region = "eu-west-1"
}

variable "output_location" {
  default = "zipped-functions/example/lambda_function_payload.zip"
}

variable "input_location" {
  default = "../example/dist/index.js"

}

variable "lambda_name" {
  default = "example_lambda_function"
}

# Zip the function for the lambda
data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.input_location
  output_path = var.output_location
}

# Create policy for the lambda 
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# Attach policy to a role
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Enable logging for lambda via cloudwatch
resource "aws_cloudwatch_log_group" "example_lambda_log_group" {
  name              = "/aws/lambda/${var.lambda_name}"
  retention_in_days = 3
}

data "aws_iam_policy_document" "lambda_logging" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}
resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy      = data.aws_iam_policy_document.lambda_logging.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

# Create lambda
resource "aws_lambda_function" "example_lambda" {
  filename         = var.output_location
  function_name    = var.lambda_name
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.example_lambda_log_group
  ]
}

# Create public access URL for the lambda
resource "aws_lambda_function_url" "example_lambda_function_url" {
  function_name      = aws_lambda_function.example_lambda.function_name
  authorization_type = "NONE"
  depends_on         = [aws_lambda_function.example_lambda]
}

output "lambda_address" {
  value = aws_lambda_function_url.example_lambda_function_url.function_url
}

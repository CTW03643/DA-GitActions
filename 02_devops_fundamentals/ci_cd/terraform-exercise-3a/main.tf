module "lambda" {
  source                = "terraform-aws-modules/lambda/aws"
  version               = "7.2.5"
  function_name         = "data-academy-download"
  handler               = "function.lambda_handler"
  runtime               = "python3.8"
  source_path           = "${path.module}/../terraform-exercise-3/code/function.py"
  attach_policy         = true
  policy                = aws_iam_policy.example.arn
  environment_variables = {
    S3_bucket = aws_s3_bucket.your_bucket.bucket_domain_name
  }
  memory_size            = 256
  ephemeral_storage_size = 2048
  timeout                = 180


}


module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.5"
  policy  = aws_iam_policy.lambda_policy.arn
  #TODO complete module
}

resource "aws_s3_bucket" "ctw03643-files" {
  bucket = "${var.project_name}-${var.identifier}"
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "${local.prefix}_lambda_module_policy"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*",
        ]
        Resource = [data.aws_s3_bucket.ctw03643-files.arn]
      }
    ]
  })
}
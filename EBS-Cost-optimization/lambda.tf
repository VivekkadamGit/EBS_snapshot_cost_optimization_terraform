
# DATA BLOCK WILL COMVERT YOUR PY FILE INTO ZIP FILE 
# WHEN WE NEED TO USE TERRAFORM FOR BUILD LAMBDA 
# YOU NEED TO UPLOAD ZIP FILE OF YOUR CODE
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_file = "${path.module}/ebs_co.py"
  output_path = "${path.module}/ebs_co.zip"
}

#RESOURCE FOR YOUR LAMBDA GIVE FILE NAME FOR ZIP FILE WHICH WILL BE 
#CREATED BY THE ABOVE FUNCTION
resource "aws_lambda_function" "cost-reporting-lambda" {
  filename         = "${path.module}/ebs_co.zip"
  function_name    = var.lambda-function-name
  role             = aws_iam_role.iam-role-cost-optimizer-EBS.arn
  handler          = "ebs_co.lambda_handler"
  timeout          = 10
  runtime          = "python3.10"
  source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
}


# FOR HANDLER: HERE YOU HAVE TO USE THE SAME NAME OF YOUR ZIP FILE WHICH IS HERE ebs_co AND 
# SAME NAME AS YOUR LAMBDA FUNCTION NAME WHICH IS HERE lambda_handler

# HAVE TO GIVE SOURCE_CODE_HAS = YOUR OUTPUT OF YOUR DATA BLOCK
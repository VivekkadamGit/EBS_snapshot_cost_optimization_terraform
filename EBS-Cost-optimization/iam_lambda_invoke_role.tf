resource "aws_iam_role_policy" "iam-role-scheduler" {
  name               = "iam-role-scheduler-invoke-${var.lambda-function-name}"
  role               = aws_iam_role.iam-role-cost-optimizer-EBS.id
  policy = file("${path.module}/iam_role_for_invoke_lambda.json")
}
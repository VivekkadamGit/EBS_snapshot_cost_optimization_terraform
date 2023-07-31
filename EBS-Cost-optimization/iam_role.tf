resource "aws_iam_role" "iam-role-cost-optimizer-EBS" {
  name               = "iam-role-${var.lambda-function-name}"
  assume_role_policy = file("${path.module}/iam_role.json")
}

# CREATE IAM ROLE FOR THE LAMBDA WHICH WILL USE THE IAM_ROLE.JSON FILE
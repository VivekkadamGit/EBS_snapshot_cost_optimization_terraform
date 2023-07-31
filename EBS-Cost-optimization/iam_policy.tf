resource "aws_iam_policy" "iam-policy-ebs-co" {
  name = "iam-policy-${var.lambda-function-name}"
  # role    = aws_iam_role.iam-role-cost-optimizer-EBS.id
  policy = file("${path.module}/iam_policy.json")

}

#THIS IAM POLOCY WILL BE GIVEN TO LAMBDA FOR EXECUTE THE DESCRIBE AND DELETE 
#SNAPSHOT FROM LAMBDA TRIGGER AS PER THE LAMBDA CODE
#CREATED SCHEDULE FOR TRIGGERING LAMBDA EVERY 7 DAYS
#YOU CAN CUSTOMISE IT, EVEN YOU CAN USE CRONJOB 
resource "aws_scheduler_schedule" "rate_scheduler" {
  name       = "rate_scheduler_for_lambda_ebs_co"
  group_name = "default"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "rate(7 days)"

  target {
    arn      = aws_lambda_function.cost-reporting-lambda.arn
    role_arn = aws_iam_role.iam-role-cost-optimizer-EBS.arn
  }
}

#NEED TO GIVE ARN OF LAMBDA WHICH YOU WANT TO TRIGGER 
# AS WELL TRIGGER POLICY TO GIVE PERMISSION TO TEIGGER LAMBDA
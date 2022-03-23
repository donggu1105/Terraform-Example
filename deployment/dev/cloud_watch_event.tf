#resource "aws_cloudwatch_event_rule" "scheduler" {
#  name                = "${var.app_environment}-send-shop-scheduler"
#  description         = "매 1분마다 재고처리된 상품 쇼핑몰로 상품 수정/전송"
#  schedule_expression = "cron(0/1 * * * ? *)"
#}
#
#resource "aws_cloudwatch_event_target" "event_target" {
#  rule      = aws_cloudwatch_event_rule.scheduler.name
#  target_id = "lambda"
#  arn       = aws_lambda_function.l.arn
#}
#
#resource "aws_lambda_permission" "allow_cloudwatch_to_call_lambda" {
#  statement_id  = "AllowExecutionFromCloudWatch"
#  action        = "lambda:InvokeFunction"
#  function_name = aws_lambda_function.stock_lambda.function_name
#  principal     = "events.amazonaws.com"
#  source_arn    = aws_cloudwatch_event_rule.scheduler.arn
#}
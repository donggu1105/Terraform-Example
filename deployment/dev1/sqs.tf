resource "aws_sqs_queue" test {
  name = "${local.prefix}-sqs"
  visibility_timeout_seconds = 900
  message_retention_seconds = 1209600
  max_message_size = 262144
  delay_seconds = 0
  receive_wait_time_seconds = 0

    tags = {
      # 환경 (ex. dev1,dev2,dev3,hotfix,prod ...)
      Environment = var.app_environment
      # 설명
      Description = var.description
      # 도메인
      Domain = var.domain
      # Tier ( private or public )
      Tier = var.tier_private
      # 버전
      Version = var.app_version
  }
}


# 상품 Worker SQS
data "aws_sqs_queue" "worker-product-sqs" {
  name = "dev1-worker-product-sqs"
}
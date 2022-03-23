
data aws_iam_role lambda_execution {
  name = "lambda_basic_execution"
}

resource aws_lambda_function test {
  // 의존성
  depends_on = [
    null_resource.ecr_image
  ]
  // 함수이름
  function_name = "${local.prefix}"
  // 람다 권한
  role = data.aws_iam_role.lambda_execution.arn
  // 타임아웃 시간
  timeout = 900
  // 도커 이미지
  image_uri = "${aws_ecr_repository.repo.repository_url}@${data.aws_ecr_image.lambda_image.id}"
  // 배포 방식
  package_type = "Image"

  // vpc 설정
  vpc_config {
    security_group_ids = [data.aws_security_group.dev-sg.id]
    subnet_ids = data.aws_subnet_ids.private.ids
  }
  // 환경변수
//    environment {
//    variables = {
//      // DB
//      MONGO_ADDRESS = var.mongo_address
//      MONGO_AUTH_MECHANISM: var.mongo_auth_mechanism
//      MONGO_AUTH_SOURCE: var.mongo_auth_source
//      MONGO_PASSWORD: var.mongo_password
//      MONGO_PORT: var.mongo_port
//      MONGO_USERNAME: var.mongo_username
//      MONGO_DB_INSTANCE: var.mongo_db_instance
//      // SQS
////      SQS_WORKER_PRODUCT : data.aws_sqs_queue.worker-product-sqs.id
//    }
//  }

    tags = local.tags

}


resource "aws_lambda_event_source_mapping" event_source_mapping {
  event_source_arn = aws_sqs_queue.test.arn
  function_name = aws_lambda_function.test.arn
}


#resource "aws_ecs_cluster" "job-api-manager-ecs-cluster" {
#  name = "${local.prefix}-cluster"
#
#
#  tags = {
#      # 환경 (ex. dev1,dev2,dev3,hotfix,prod ...)
#      Environment = var.app_environment
#      # 설명
#      Description = var.description
#      # 도메인
#      Domain = var.domain
#      # Tier ( private or public )
#      Tier = var.tier_private
#      # 버전
#      Version = var.app_version
#  }
#
#  }
#
#
#data aws_iam_role ecs-role-execution {
#  name = "ecsTaskExecutionRole"
#}
#
#data "template_file" "template_file" {
#  template = file("${var.app_environment}_task_definition.json")
#
#  vars = {
#    name = "${local.prefix}-container"
#    image = "${aws_ecr_repository.repo.repository_url}:${var.ecr_image_tag}"
#    // DB
#    MONGO_ADDRESS = var.mongo_address
#    MONGO_PORT = var.mongo_port
#    MONGO_DB_INSTANCE = var.mongo_db_instance
#    MONGO_USERNAME = var.mongo_username
#    MONGO_PASSWORD = var.mongo_password
#    MONGO_AUTH_SOURCE = var.mongo_auth_source
#    MONGO_AUTH_MECHANISM = var.mongo_auth_mechanism
#    // LOG
#    awslogs-group = aws_cloudwatch_log_group.job-api-manager-log-group.id
#    awslogs-region = var.region
#    awslogs-stream-prefix = local.prefix
#    LOG_STAGE = var.log_stage
#    APPLICATION_NAME = local.prefix
#    // SQS
#    SQS_JOB_MANAGER_URL: data.aws_sqs_queue.job-manager-sqs.id
#    SQS_JOB_CLOSE_MANAGER_URL : data.aws_sqs_queue.job-close-manager-sqs.id
#    SQS_PRODUCT_URL: data.aws_sqs_queue.worker-product-sqs.id
#    SQS_ORDER_URL: data.aws_sqs_queue.worker-order-sqs.id
#    SQS_STOCK_SYNC_URL: data.aws_sqs_queue.worker-stock-sync-sqs.id
#    // API
#    FLASK_API_URL: var.flask_api_url
#    COLLECT_SAVE_API_URL: var.collect_save_api_url
#    WORKER_API_URL: var.worker_api_url
#  }
#}
#
#
#resource "aws_ecs_task_definition" job-api-manager-task-definition {
#  family                   = "${local.prefix}-task-definition"
#  network_mode             = "awsvpc"
#  requires_compatibilities = ["FARGATE"]
#  memory                   = "1024"
#  cpu                      = "512"
#  task_role_arn = data.aws_iam_role.ecs-role-execution.arn
#  execution_role_arn       =  data.aws_iam_role.ecs-role-execution.arn
#  container_definitions    =  data.template_file.template_file.rendered
#}
#
#resource "aws_ecs_service" "job-api-manager-ecs-service" {
#  name            = "${local.prefix}-service"
#  cluster         = aws_ecs_cluster.job-api-manager-ecs-cluster.id
#  task_definition = aws_ecs_task_definition.job-api-manager-task-definition.arn
#  launch_type     = "FARGATE"
#
#  # (Optional) Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers.
#  health_check_grace_period_seconds = 2147483647
#
#  network_configuration {
#    subnets          = data.aws_subnet_ids.private.ids
#    assign_public_ip = true
#    security_groups = [data.aws_security_group.prod_ecs_sg.id]
#  }
#
#  load_balancer {
#    target_group_arn = aws_alb_target_group.container-alb-target-group.id
#    container_name   = "${local.prefix}-container"
#    container_port   = "8000"
#  }
#
#  desired_count = 1
#}
#

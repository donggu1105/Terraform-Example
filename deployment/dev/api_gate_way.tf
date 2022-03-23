//// infrastructure/github-status.tf
//
//// API 정의
//resource "aws_api_gateway_rest_api" "job_api" {
//  name        = "${local.prefix}-gateway"
//  description = "잡 매니저 API"
//
//}
//
//resource "aws_api_gateway_resource" "job_resource" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_rest_api.job_api.root_resource_id
//  path_part   = "job"
//}
//
//resource "aws_api_gateway_resource" "job_task_resource" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_rest_api.job_api.root_resource_id
//  path_part   = "jobTask"
//}
////================================================================
//
//// API 리소스 정의 (/check 같은 경로)
//resource "aws_api_gateway_resource" "job_create" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_resource.job_resource.id
//  path_part   = "create"
//}
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_create" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_create.id
//  http_method   = "POST"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "job_create" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_create.id
//  http_method = aws_api_gateway_method.job_create.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//
////================================================================
//// API 리소스 정의 (/check 같은 경로)
//resource "aws_api_gateway_resource" "job_task_update" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_resource.job_task_resource.id
//  path_part   = "update"
//}
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_task_update" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_task_update.id
//  http_method   = "POST"
//  authorization = "NONE"
//}
//
//resource "aws_api_gateway_integration" "job_task_update" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_task_update.id
//  http_method = aws_api_gateway_method.job_task_update.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
//
////================================================================
//
//
//// API 리소스 정의 (/check 같은 경로)
//resource "aws_api_gateway_resource" "job_update" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_resource.job_resource.id
//  path_part   = "update"
//}
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_update" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_update.id
//  http_method   = "POST"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "job_update" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_update.id
//  http_method = aws_api_gateway_method.job_update.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//
////================================================================
//// API 리소스 정의 (/check 같은 경로)
//resource "aws_api_gateway_resource" "job_history" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_resource.job_resource.id
//  path_part   = "history"
//}
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_history" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_history.id
//  http_method   = "GET"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "job_history" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_history.id
//  http_method = aws_api_gateway_method.job_history.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//
//
////================================================================
//// API 리소스 정의 (/check 같은 경로)
//resource "aws_api_gateway_resource" "job_task_create" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_resource.job_task_resource.id
//  path_part   = "create"
//}
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_task_create" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_task_create.id
//  http_method   = "POST"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "job_task_create" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_task_create.id
//  http_method = aws_api_gateway_method.job_task_create.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//
//
////================================================================
//// API 리소스 정의 (/check 같은 경로)
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_get" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_resource.id
//  http_method   = "GET"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "job_get" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_resource.id
//  http_method = aws_api_gateway_method.job_get.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//
//
////================================================================
//// API 리소스 정의 (/check 같은 경로)
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "job_task_get" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.job_task_resource.id
//  http_method   = "GET"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "job_task_get" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.job_task_resource.id
//  http_method = aws_api_gateway_method.job_task_get.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//
////================================================================
//// API 리소스 정의 (/check 같은 경로)
//resource "aws_api_gateway_resource" "work_result_get" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  parent_id   = aws_api_gateway_rest_api.job_api.root_resource_id
//  path_part   = "workResult"
//}
//
//// API 리소스의 메서드 정의 (GET, POST 등)
//resource "aws_api_gateway_method" "work_result_get" {
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  resource_id   = aws_api_gateway_resource.work_result_get.id
//  http_method   = "GET"
//  authorization = "NONE"
//}
//
//// API와 Lambda 통합
//resource "aws_api_gateway_integration" "work_result_get" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//  resource_id = aws_api_gateway_resource.work_result_get.id
//  http_method = aws_api_gateway_method.work_result_get.http_method
//  type = "AWS_PROXY"
//  integration_http_method = "POST"
//  uri = aws_lambda_function.job_manager_lambda.invoke_arn
//}
////================================================================
//resource "aws_api_gateway_deployment" "job_gateway" {
//  rest_api_id = aws_api_gateway_rest_api.job_api.id
//
//  depends_on = [
//    aws_api_gateway_integration.job_create,
//    aws_api_gateway_integration.job_update,
//    aws_api_gateway_integration.job_task_update,
//    aws_api_gateway_integration.job_history,
//    aws_api_gateway_integration.job_task_create,
//    aws_api_gateway_integration.job_get,
//    aws_api_gateway_integration.job_task_get,
//    aws_api_gateway_integration.work_result_get
//  ]
//
//    triggers = {
//    # NOTE: The configuration below will satisfy ordering considerations,
//    #       but not pick up all future REST API changes. More advanced patterns
//    #       are possible, such as using the filesha1() function against the
//    #       Terraform configuration file(s) or removing the .id references to
//    #       calculate a hash against whole resources. Be aware that using whole
//    #       resources will show a difference after the initial implementation.
//    #       It will stabilize to only change when resources change afterwards.
//    redeployment = sha1(jsonencode([
//      aws_api_gateway_resource.job_create.id,
//      aws_api_gateway_method.job_create.id,
//      aws_api_gateway_integration.job_create.id,
//      //
//      aws_api_gateway_resource.job_update.id,
//      aws_api_gateway_method.job_update.id,
//      aws_api_gateway_integration.job_update.id,
//      //
//      aws_api_gateway_resource.job_task_update.id,
//      aws_api_gateway_method.job_task_update.id,
//      aws_api_gateway_integration.job_task_update.id,
//      //
//      aws_api_gateway_resource.job_history.id,
//      aws_api_gateway_method.job_history.id,
//      aws_api_gateway_integration.job_history.id,
//      //
//      aws_api_gateway_resource.job_task_create.id,
//      aws_api_gateway_method.job_task_create.id,
//      aws_api_gateway_integration.job_task_create.id,
//      //
//      aws_api_gateway_resource.job_resource.id,
//      aws_api_gateway_method.job_get.id,
//      aws_api_gateway_integration.job_get.id,
//      //
//      aws_api_gateway_resource.job_task_resource.id,
//      aws_api_gateway_method.job_task_get.id,
//      aws_api_gateway_integration.job_task_get.id,
//      //
//      aws_api_gateway_resource.work_result_get.id,
//      aws_api_gateway_method.work_result_get.id,
//      aws_api_gateway_integration.work_result_get.id,
//    ]))
//  }
//
//  lifecycle {
//    create_before_destroy = true
//  }
//}
//
//resource "aws_api_gateway_stage" "job_api_stage" {
//  deployment_id = aws_api_gateway_deployment.job_gateway.id
//  rest_api_id   = aws_api_gateway_rest_api.job_api.id
//  stage_name    = var.app_environment
//}

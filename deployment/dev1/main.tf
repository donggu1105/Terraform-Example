// Provider
// - Terraform과 외부 서비스를 연결해주는 기능을 하는 모듈
// - AWS, Azure, GCP와 같은 Public Cloud 뿐만 아니라, MySQL, DOcker와 같은 Local Service 등을 지원
// - 서비스 종류 : https://registry.terraform.io/browse/providers (다양한 provider가 존재합니다)
provider "aws" {
  region = var.region
}
//Terraform에서 Data Sources를 통해 Terraform 외부에서 정의되거나 다른 별도의 Terraform 구성에 의해 정의되거나 기능에 의해 수정된 정보를 사용할 수 있습니다.
data aws_caller_identity current {}

# 공유 백엔드 설정
//terraform {
//  # 테라폼 버전 명시
//  required_version = "~> 1.0.5"
//  backend "s3" {
//    # ToDo : [VERY important] 경로 정확히 할것!! -> 경로가 겹칠시 .tfstate 덮어쓰기 된다.
//    key = "onesell-terraform-example/dev1/terraform.tfstate"
//  }
//}



locals {
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
  prefix = "${var.app_environment}-${var.app_name}"
  account_id = data.aws_caller_identity.current.account_id
}
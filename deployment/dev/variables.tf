variable "region" {
    description = "region"
    type        = string
    default = "ap-northeast-2"
}

variable "app_version" {
    description = "app version"
    type        = string
    default = "1.0.0"
}

variable "app_environment" {
    description = "app_environment"
    type        = string
    default = "test"
  }

variable "app_name" {
    description = "app_name"
    type        = string
    default = "terraform-example"
  }

# =============================================== 태그 관련 변수  ===============================================

variable "domain" {
  default = "test"
  description = "도메인 변수"
  type        = string
}


variable "description" {
  default = "test"
  description = "설명 변수"
  type        = string
}


variable "tier_private" {
    description = "티어 (private)"
    type        = string
    default = "Private"
}

variable "tier_public" {
    description = "티어 (public)"
    type        = string
    default = "Public"
}




# =============================================== DB 관련 환경변수  ===============================================

variable "mongo_address" {
  type    = string
  sensitive = true
}

variable "mongo_port" {
  type    = string
  sensitive = true
}

variable "mongo_db_instance" {
  type    = string
  sensitive = true
}

variable "mongo_username" {
  type    = string
  sensitive = true
}

variable "mongo_password" {
  type    = string
  sensitive = true
}

variable "mongo_auth_source" {
  type    = string
  sensitive = true
}

variable "mongo_auth_mechanism" {
  type    = string
  sensitive = true
}



variable "ecr_image_tag" {
    description = "ecr_image_tag"
    type        = string
    default = "latest"
  }

variable "dev_vpc_id" {
    default = "vpc-0be9e2f268d3cdcaa"
    description = "개발 환경 vpc id"
    type        = string
}

variable "prod_vpc_id" {
    default = "vpc-069cfc733e69fd930"
    description = "운영 환경 vpc id"
    type        = string
}

variable "prod_security_group_id" {
  default = "sg-0700289a77a6c225f"
  description = "운영 환경 security group id"
  type        = string
}

variable "dev_security_group_id" {
  default = "sg-05e3c242d247ec377"
  description = "개발 환경 security group id"
  type        = string
}
resource "aws_ecr_repository" "repo" {
  name = "${local.prefix}-repository"

  tags = local.tags
}
// 테라폼 프로비저너(provisioner)는 테라폼을 실행할 때 부트스트랩, 구성 관리 또는 정리 작업을 수행하기 위해 로컬 시스템이나 원격 시스템에서 스크립트를 실행하는데 사용된다
resource "null_resource" "ecr_image" {
  triggers = {
    always_run = timestamp()
    python_file = md5(file("../../app.py"))
    docker_file = md5(file("../../Dockerfile"))
  }
  provisioner "local-exec" {
    command = <<EOF
            sudo docker login -u AWS -p $(aws ecr get-login-password --region ${var.region}) ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ../../
            sudo docker image prune -a -f
            sudo docker build -t ${var.app_name} .
            sudo docker tag ${var.app_name}:${var.ecr_image_tag} ${aws_ecr_repository.repo.repository_url}:${var.ecr_image_tag}
            sudo docker push ${aws_ecr_repository.repo.repository_url}:${var.ecr_image_tag}
            EOF
  }
}

data aws_ecr_image lambda_image {
  depends_on = [
    null_resource.ecr_image
  ]
  repository_name = aws_ecr_repository.repo.name
  image_tag = var.ecr_image_tag
}



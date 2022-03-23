
data "aws_vpc" "vpc" {
  id = var.dev_vpc_id
}

data "aws_subnet_ids" "private" {
    vpc_id = data.aws_vpc.vpc.id

    tags = {
        Tier = var.tier_private
    }
}

data "aws_subnet_ids" "public" {
    vpc_id = data.aws_vpc.vpc.id

    tags = {
        Tier = var.tier_public
    }
}
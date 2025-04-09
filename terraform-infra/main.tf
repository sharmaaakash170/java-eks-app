module "vpc" {
  source = "./modules/vpc"
  project = var.project
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs = var.azs
}

module "iam" {
  source = "./modules/iam"
  project = var.project
}

module "eks" {
  source = "./modules/eks"
  project = var.project
  subnet_ids = module.vpc.public_subnet_ids
  eks_role_arn =  module.iam.eks_role_arn
  node_group_role_arn = module.iam.node_group_role_arn
}

module "ecr" {
  source = "./modules/ecr"
  repo_name = "${var.project}-java-app"
}

module "codebuild" {
  source = "./modules/codebuild"
  project = var.project
  github_repo = var.github_repo
  ecr_url = module.ecr.repository_url
  service_role = module.iam.codebuild_role_arn
}

module "s3" {
  source  = "./modules/s3"
  project = var.project
}

module "codepipeline" {
  source = "./modules/codepipeline"
  project = var.project
  github_owner = var.github_owner
  github_repo_name = var.github_repo
  github_branch = var.github_branch 
  github_token = var.github_token 
  artifact_bucket = module.s3.bucket_id
  pipeline_role_arn = module.iam.pipeline_role_arn
  codebuild_project_name = module.codebuild.codebuild_project_name
}

module "helm_charts" {
  source = "./modules/helm-charts"
  project = var.project
  image_repo = module.ecr.repository_url
  image_tag = var.image_tag
}
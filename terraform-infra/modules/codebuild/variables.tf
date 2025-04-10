variable "project" {
  type = string
}

variable "github_repo" {
  description = "GitHub repo URL (e.g., https://github.com/user/repo)"
  type        = string
}

variable "ecr_url" {
  description = "ECR repository URL"
  type        = string
}

variable "service_role" {}
variable "aws_region" {}
variable "repository_url" {}
variable "eks_cluster_name" {}


output "eks_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "node_group_role_arn" {
  value = aws_iam_role.eks_node_group_role.arn
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "pipeline_role_arn" {
  value = aws_iam_role.pipeline_role.arn
}
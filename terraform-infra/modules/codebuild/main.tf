resource "aws_codebuild_project" "java_build" {
  name = "${var.project}"
  description = "CodeBuild for java app"
  service_role = var.service_role
  build_timeout = 10

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:7.0"
    privileged_mode = true
    type = "LINUX_CONTAINER"
    environment_variable{
      name = "REPOSITORY_URI"
      value = var.ecr_url
    }
  }
  source {
    type = "GITHUB"
    location = var.github_repo
    buildspec = "buildspec.yml"
    git_clone_depth = 1
  }

  tags = {
    Name = "${var.project}-codebuild"
  }
}
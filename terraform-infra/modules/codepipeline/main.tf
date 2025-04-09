resource "aws_codepipeline" "this" {
  name = "${var.project}-pipeline"
  role_arn = var.pipeline_role_arn

  artifact_store {
    type = "S3"
    location = var.artifact_bucket
  }
  stage {
    name = "Source"
    action {
      name = "SourceAction"
      category = "Source"
      owner = "ThirdParty"
      provider = "GitHub"
      version = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner = var.github_owner
        Repo = var.github_repo_name
        Branch = var.github_branch
        OAuthToken = var.github_token
      }
    }
  }

  stage {
    name = "Build"

    action {
      name = "BuildAction"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      input_artifacts = [ "source_output" ]
      output_artifacts = [ "build_output" ]
      version = "1"

      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }
}
resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "${var.project}-artifacts-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "${var.project}-artifact-bucket"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
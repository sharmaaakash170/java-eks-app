variable "project" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "github_repo" {
  type = string
}

variable "github_owner" {
  type = string
}

variable "github_branch" {
  type = string
}

variable "image_tag" {
  type = string
}

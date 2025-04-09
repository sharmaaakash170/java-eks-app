variable "project" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "eks_role_arn" {
  type = string
}

variable "node_group_role_arn" {
  type = string
}

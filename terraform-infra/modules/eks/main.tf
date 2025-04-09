resource "aws_eks_cluster" "this" {
  role_arn = var.eks_role_arn
  name = "${var.project}-eks-cluster"
  vpc_config {
    subnet_ids = var.subnet_ids 
  }
}

resource "aws_eks_node_group" "this" {
  node_group_name = "${var.project}-node-group"
  cluster_name = aws_eks_cluster.this.name
  node_role_arn = var.node_group_role_arn
  subnet_ids = var.subnet_ids
  remote_access {
    ec2_ssh_key = var.key_name
    source_security_group_ids = [ var.node_sg_id ]
  }
  scaling_config {
    desired_size = 2
    min_size = 1
    max_size = 3
  }
  instance_types = [ "t3.medium" ]
}
resource "aws_security_group" "node_group_sg" {
  name = "${var.project}-worker-node-sg"
  vpc_id = var.vpc_id 
  tags = {
    Name = "${var.project}-node-group-sg"
  }
}

resource "aws_security_group_rule" "allow_http_from_internet" {
  description       = "Allow HTTP access on port 80"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.node_group_sg.id 
}

resource "aws_security_group_rule" "allow_10250" {
  description       = "Allow HTTP access on port 10250"
  type              = "ingress"
  from_port         = 10250
  to_port           = 10250
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.node_group_sg.id 
}

resource "aws_security_group_rule" "allow_443" {
  description       = "Allow HTTP access on port 443"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.node_group_sg.id 
}

resource "aws_security_group_rule" "egress_rules" {
  security_group_id = aws_security_group.node_group_sg.id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]
}
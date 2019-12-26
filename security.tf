resource "aws_security_group" "jenkins" {
  name        = "${var.metadata["project"]}-${var.metadata["env"]}-jenkins"
  description = "Security group for jenkins"
  vpc_id      = "${data.aws_vpc.rs-dev.id}"

  tags = "${
    map(
     "Name", "${var.metadata["project"]}-${var.metadata["env"]}-jenkins"
    )
  }"
}

resource "aws_security_group_rule" "jenkins-ingress-https" {
  description       = "Allow inbound https"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.jenkins.id}"
  to_port           = 443
  type              = "ingress"
  cidr_blocks       = ["${var.cidrs["rs_network"]}"]
}

resource "aws_security_group_rule" "jenkins-ingress-ssh" {
  description       = "Allow inbound ssh"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.jenkins.id}"
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["${var.cidrs["rs_network"]}"]
}

resource "aws_security_group_rule" "jenkins-egress-everything" {
  description       = "Allow outbound everything"
  from_port         = 0
  protocol          = "tcp"
  security_group_id = "${aws_security_group.jenkins.id}"
  to_port           = 65535
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

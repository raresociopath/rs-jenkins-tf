resource "aws_instance" "jenkins" {
  ami                    = "ami-02684cdd09ecc9bb9"
  instance_type          = "t2.medium"
  subnet_id              = "${element(data.aws_subnet_ids.public.ids, 2)}"
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]

  key_name = "${aws_key_pair.jenkins.key_name}"

  tags {
    Name = "${var.metadata["project"]}/${var.metadata["env"]}/jenkins"
    Role = "jenkins"
  }

  root_block_device {
    volume_size = 100
  }
}

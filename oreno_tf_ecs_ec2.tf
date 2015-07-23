resource "aws_instance" "oreno_tf_ecs" {
  count = 1
  instance_type = "${var.instance_type}"
  ami = "${lookup(var.aws_amis, var.region)}"
  subnet_id = "${var.subnet}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.securiy_group}"]
  iam_instance_profile = "${var.iam_profile_name}"
  key_name = "${var.ssh_key_name}"
  tags = {
    Name = "${lookup(var.tag_names, count.index)}"
  }
  user_data = "${file("user_data/userdata.sh")}"
}

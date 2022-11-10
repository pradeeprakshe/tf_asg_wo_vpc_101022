resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
image_id = "$var.required_ami" 
  instance_type = "$var.instance_type"
  key_name = "$var.ec2key"
security_groups = [ "${aws_security_group.Prodsg.id}" ]
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
lifecycle {
    create_before_destroy = true
  }
}
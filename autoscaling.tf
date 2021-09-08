provider "aws" {
    region = var.region
}
resource "aws_launch_template" "app_launch_template" {
    name = "app-launch-template"
    image_id = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.app_server-sg.id}"]
  
}

resource "aws_autoscaling_group" "app_autoscaling" {
    availability_zones = ["us-east-2a"]
    name = "app-autoscalinggroup"
    min_size = 1
    max_size = 3

    launch_template {
      id = aws_launch_template.app_launch_template.id
      version = "$Latest"
    }
}
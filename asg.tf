resource "aws_autoscaling_group" "agents" {
    availability_zones = ["us-west-2a","us-west-2b"]
    name = "agents"
    max_size = "4"
    min_size = "2"
    health_check_grace_period = 300
    health_check_type = "EC2"
    desired_capacity = 2
    force_delete = true
    launch_configuration = aws_launch_configuration.agent-lc.name
    target_group_arns = [aws_lb_target_group.tg1.arn]

    tag {
        key = "Name"
        value = "Agent Instance"
        propagate_at_launch = true
    }
}

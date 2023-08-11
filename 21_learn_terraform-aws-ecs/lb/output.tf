
output "lb_target_group_arn" {
    value = "${aws_lb_target_group.learn_lb_target_group.arn}"
}

output "lb_dns_name" {
    value = "${aws_lb.learn_lb.dns_name}"
}

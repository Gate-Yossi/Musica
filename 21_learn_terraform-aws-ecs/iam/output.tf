
output "task_role_arn" {
    value = "${aws_iam_role.learn_ecs_task_role.arn}"
}

output "execution_role_arn" {
    value = "${aws_iam_role.learn_ecs_task_execution_role.arn}"
}

resource "aws_iam_role" "learn_ecs_task_execution_role" {
  name   = var.tag_name
  assume_role_policy = file("${path.module}/role_policy.json")
}

resource "aws_iam_policy" "learn_ecs_task_execution_role_policy" {
  name   = var.tag_name
  policy = file("${path.module}/policy_task_execution.json")
}

resource "aws_iam_role_policy_attachment" "learn_ecs_task_execution_role_policy" {
  role       = aws_iam_role.learn_ecs_task_execution_role.name
  policy_arn = aws_iam_policy.learn_ecs_task_execution_role_policy.arn
}

resource "aws_iam_role" "learn_ecs_task_role" {
  name   = "${var.tag_name}_task_role"
  assume_role_policy = file("${path.module}/role_policy.json")
}

resource "aws_iam_policy" "learn_ecs_task_role_policy_ssmmessages" {
  name   = "${var.tag_name}_policy_ssmmessages"
  policy = file("${path.module}/policy_ssmmessages.json")
}

resource "aws_iam_role_policy_attachment" "learn_ecs_task_role_policy_ssmmessages" {
  role       = aws_iam_role.learn_ecs_task_role.name
  policy_arn = aws_iam_policy.learn_ecs_task_role_policy_ssmmessages.arn
}

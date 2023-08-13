resource "aws_iam_role" "learn_ecs_task_execution_role" {
  name   = var.tag_name

  assume_role_policy = <<-EOS
  {
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  EOS
}

resource "aws_iam_policy" "learn_ecs_task_execution_role_policy" {
  name   = var.tag_name
  policy = <<-EOS
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:CreateLogGroup"
            ],
            "Resource": "*"
        }
    ]
  }
  EOS
}

resource "aws_iam_role_policy_attachment" "learn_ecs_task_execution_role_policy" {
  role       = aws_iam_role.learn_ecs_task_execution_role.name
  policy_arn = aws_iam_policy.learn_ecs_task_execution_role_policy.arn
}

resource "aws_iam_role" "learn_ecs_task_role" {
  name   = "${var.tag_name}_task_role"

  assume_role_policy = <<-EOS
  {
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  EOS
}

resource "aws_iam_policy" "learn_ecs_task_role_policy_ssmmessages" {
  name   = "${var.tag_name}_policy_ssmmessages"
  policy = <<-EOS
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel"
            ],
            "Resource": "*"
        }
    ]
  }
  EOS
}

resource "aws_iam_role_policy_attachment" "learn_ecs_task_role_policy_ssmmessages" {
  role       = aws_iam_role.learn_ecs_task_role.name
  policy_arn = aws_iam_policy.learn_ecs_task_role_policy_ssmmessages.arn
}

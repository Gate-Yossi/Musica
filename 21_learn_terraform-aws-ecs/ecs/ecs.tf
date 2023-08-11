
resource "aws_ecs_cluster" "learn_ecs_cluster" {
  name   = var.tag_name
}

locals {
  container_name = "learn_ecs_nginx"
}

resource "aws_ecs_task_definition" "learn_ecs_task" {
  family                   = "learn-ecs-task-definition"
  cpu                      = 512
  memory                   = 1024
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "${var.execution_role_arn}"
  network_mode             = "awsvpc"
  container_definitions    = <<-EOS
  [
    {
        "name": "${local.container_name}",
        "image": "${var.repository_url}:0.0.1",
        "cpu": 0,
        "portMappings": [
            {
                "name": "${local.container_name}",
                "containerPort": 80,
                "hostPort": 80,
                "protocol": "tcp",
                "appProtocol": "http"
            }
        ],
        "essential": true,
        "environment": [],
        "environmentFiles": [],
        "mountPoints": [],
        "volumesFrom": [],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-create-group": "true",
                "awslogs-group": "/ecs/learn-ecs-task-definition",
                "awslogs-region": "ap-northeast-1",
                "awslogs-stream-prefix": "ecs"
            }
        }
    }
  ]
  EOS
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}

resource "aws_ecs_service" "learn_ecs_service" {
  name            = var.tag_name
  cluster         = aws_ecs_cluster.learn_ecs_cluster.id
  task_definition = aws_ecs_task_definition.learn_ecs_task.arn
  launch_type     = "FARGATE"
  desired_count   = 2
  network_configuration {
    subnets = [
      "${var.public_a_id}",
      "${var.public_c_id}"
    ]
    security_groups = [
      "${var.sg_id}"
    ]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = "${var.lb_target_group_arn}"
    container_name   = local.container_name
    container_port   = 80
  }
}

locals {
  aurora_database_name   = "learn"
  aurora_master_username = "learn_user"
  aurora_master_password = "Passw0rd"
}

resource "aws_rds_cluster" "learn" {
  cluster_identifier              = "${var.name_prefix}-rds-cluster"
  engine                          = "aurora-mysql"
  engine_version                  = "8.0.mysql_aurora.3.02.0"
  database_name                   = local.aurora_database_name
  master_username                 = local.aurora_master_username
  master_password                 = local.aurora_master_password
  port                            = 3306
  vpc_security_group_ids          = ["${var.sg_id}"]
  db_subnet_group_name            = aws_db_subnet_group.learn.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.learn.name

  skip_final_snapshot = true
  apply_immediately   = true
}

resource "aws_rds_cluster_parameter_group" "learn" {
  name   = "${var.name_prefix}-database-cluster-parameter-group"
  family = "aurora-mysql8.0"

  parameter {
    name         = "character_set_client"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_connection"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_database"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_filesystem"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_results"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_server"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_connection"
    value        = "utf8mb4_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_server"
    value        = "utf8mb4_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}

resource "aws_db_subnet_group" "learn" {
  name = "${var.name_prefix}-db-subnet"
  subnet_ids = ["${var.public_a_id}", "${var.public_c_id}"]
}

resource "aws_rds_cluster_instance" "learn" {
  count = 1

  cluster_identifier = aws_rds_cluster.learn.id
  identifier              = "${var.name_prefix}-rds-instance-${count.index}"

  engine                  = aws_rds_cluster.learn.engine
  engine_version          = aws_rds_cluster.learn.engine_version
  instance_class          = "db.t3.medium"
  db_subnet_group_name    = aws_db_subnet_group.learn.name
  db_parameter_group_name = aws_db_parameter_group.learn.name

  publicly_accessible = true
}

resource "aws_rds_cluster_instance" "learn-replica" {
  count = 2

  cluster_identifier = aws_rds_cluster.learn.id
  identifier              = "${var.name_prefix}-rds-instance-${count.index}-replica"

  engine                  = aws_rds_cluster.learn.engine
  engine_version          = aws_rds_cluster.learn.engine_version
  instance_class          = "db.t3.medium"
  db_subnet_group_name    = aws_db_subnet_group.learn.name
  db_parameter_group_name = aws_db_parameter_group.learn.name
  depends_on              = [aws_rds_cluster_instance.learn]

  publicly_accessible = true
}

resource "aws_db_parameter_group" "learn" {
  name   = "${var.name_prefix}-db-parameter-group"
  family = "aurora-mysql8.0"
}


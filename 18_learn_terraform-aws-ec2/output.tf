
# 作成したEC2のパブリックIPアドレスを出力
output "ec2_global_ips" {
  value = aws_instance.learn_ec2_instance.*.public_ip
}

output "secretsmanager_secret" {
  value = aws_secretsmanager_secret.learn_ec2_secret.id
}

output "secretsmanager_secret_version" {
  value = aws_secretsmanager_secret_version.learn_ec2_secret.id
}

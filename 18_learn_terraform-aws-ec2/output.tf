
# 作成したEC2のパブリックIPアドレスを出力
output "ec2_global_ips" {
  value = aws_instance.learn_ec2_instance.*.public_ip
}

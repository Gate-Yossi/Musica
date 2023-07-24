
# AmazonSSMManagedInstanceCore policyを付加したロールを作成
resource "aws_iam_role" "learn-aws-ec2-ssm-role" {
  name               = var.tag_name
  assume_role_policy = data.aws_iam_policy_document.learn-aws-ec2-assume-role.json
}

data "aws_iam_policy_document" "learn-aws-ec2-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "learn-aws-ec2-policy_ssm_managed_instance_core" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "learn-aws-ec2-ssm_managed_instance_core" {
  role       = aws_iam_role.learn-aws-ec2-ssm-role.name
  policy_arn = data.aws_iam_policy.learn-aws-ec2-policy_ssm_managed_instance_core.arn
}

# インスタンスプロファイルを作成
resource "aws_iam_instance_profile" "learn-aws-ec2-profile" {
  name = var.tag_name
  role = aws_iam_role.learn-aws-ec2-ssm-role.name
}

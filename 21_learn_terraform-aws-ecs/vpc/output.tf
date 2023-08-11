
output "vpc_id" {
    value = "${aws_vpc.learn_ecs_vpc.id}"
}

output "public_a_id" {
    value = "${aws_subnet.learn_ecs_public_subnet_1a.id}"
}

output "public_c_id" {
    value = "${aws_subnet.learn_ecs_public_subnet_1c.id}"
}

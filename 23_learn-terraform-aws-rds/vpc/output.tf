
output "vpc_id" {
    value = "${aws_vpc.default.id}"
}

output "public_a_id" {
    value = "${aws_subnet.public_1a.id}"
}

output "public_c_id" {
    value = "${aws_subnet.public_1c.id}"
}

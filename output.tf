output "ec2_ips" {
  value = ["${aws_instance.app.*.public_ip}"]
}

output "atlas_connection_string" {
  value = mongodbatlas_cluster.aws_app.connection_strings
}

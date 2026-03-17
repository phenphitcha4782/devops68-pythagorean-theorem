output "public_ip" {

  value = aws_instance.node_app.public_ip

}

output "api_url" {

value = "http://${aws_instance.node_app.public_ip}:3015/calculate?a=3&b=4"

}
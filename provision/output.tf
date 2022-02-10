
output "login-string" {
  value = <<EOF
ssh -i keys/tfe-deploy.pem ubuntu@${join(",",aws_instance.tfe-01.*.public_ip)}
EOF
}

#output "lb_url" {
#  description = "URL of load balancer"
#  value       = "http://${aws_elb.webserver-lb.dns_name}/"
#}

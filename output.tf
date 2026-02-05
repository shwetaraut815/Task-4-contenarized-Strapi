output "public_ip" {
  value = module.ec2.public_ip
}

output "private_key_pem" {
  value     = module.ec2.private_key_pem
  sensitive = true
}

output "load_balancer_dns" {
  value = module.alb.alb_dns_name
}


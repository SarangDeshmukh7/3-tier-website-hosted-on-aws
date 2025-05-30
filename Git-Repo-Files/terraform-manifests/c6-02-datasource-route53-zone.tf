data "aws_route53_zone" "mydomain" {
  name         = "sarang-devops.com"
  private_zone = false

}

output "zone-id" {
    description = "zone ID of register domain"
    value = data.aws_route53_zone.mydomain.zone_id
}

output "domain-name" {
    description = "my domain name"
    value = data.aws_route53_zone.mydomain.name
  
}
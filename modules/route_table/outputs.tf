output "route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public_rt.id
}

output "route_table_association_id" {
  description = "ID of the route table association"
  value       = aws_route_table_association.public_assoc.id
}
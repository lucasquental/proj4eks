output "rds-endpoint" {  
    value = aws_db_instance.postgresql.endpoint
}
output "rds-port" {  
    value = aws_db_instance.postgresql.port
}
output "rds-username" {  
    value = aws_db_instance.postgresql.username
}
output "rds-database-name" {  
    value = aws_db_instance.postgresql.db_name
}
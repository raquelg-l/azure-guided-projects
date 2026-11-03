output "primary_web_endpoint" {
  description = "Public URL of the static website"
  value       = azurerm_storage_account.this.primary_web_endpoint
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

# Prints results after terraform apply
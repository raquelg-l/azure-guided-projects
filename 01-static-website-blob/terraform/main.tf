# Exercise 01, Task 01: Create resource group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

# Exercise 01, Task 02: Create storage account
resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Exercise 01, Task 03: Enable static website hosting
resource "azurerm_storage_account_static_website" "this" {
  storage_account_id = azurerm_storage_account.this.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

# Finds the automatically created $web container and lists the files to upload
data "azurerm_storage_container" "web" {
  name               = "$web"
  storage_account_id = azurerm_storage_account.this.id

  depends_on = [azurerm_storage_account_static_website.this]
}

locals {
  site_files = toset(["index.html", "404.html"])
}

# Exercise 02 and 03: Task 03: Upload files
resource "azurerm_storage_blob" "site" {
  for_each = local.site_files

  name                 = each.value
  storage_container_id = data.azurerm_storage_container.web.id
  type                 = "Block"
  content_type         = "text/html"
  source               = "${path.module}/../site/${each.value}"
  content_md5          = filemd5("${path.module}/../site/${each.value}")
}
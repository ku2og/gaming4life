resource "azurerm_storage_account" "sa-function_app-westEU" {
  name                     = var.fapp_westEU["name"]
  resource_group_name      = azurerm_resource_group.rg-master.name
  location                 = azurerm_resource_group.rg-master.location
  account_tier             = var.fapp_westEU["account_tier"]
  account_replication_type = var.fapp_westEU["account_replication_type"]
}

resource "azurerm_app_service_plan" "asp-westEU" {
  name                = var.fapp_westEU["plan_name"]
  location            = azurerm_resource_group.rg-master.location
  resource_group_name = azurerm_resource_group.rg-master.name
  kind                = var.fapp_westEU["kind"]
  reserved            = true

  sku {
    tier = var.fapp_westEU["sku_tier"]
    size = var.fapp_westEU["sku_size"]
  }
}

resource "azurerm_function_app" "fa-westEU" {
  name                       = var.fapp_westEU["fap_name"]
  location                   = azurerm_resource_group.rg-master.location
  resource_group_name        = azurerm_resource_group.rg-master.name
  app_service_plan_id        = azurerm_app_service_plan.asp-westEU.id
  storage_account_name       = azurerm_storage_account.sa-function_app-westEU.name
  storage_account_access_key = azurerm_storage_account.sa-function_app-westEU.primary_access_key
  os_type                    = var.fapp_westEU["os_type"]
}
resource "azurerm_resource_group" "rg-master" {
  location = var.Backend_westeu["location"]
  name     = var.Backend_westeu["rg-name"]
}

resource "azurerm_mysql_server" "master_srv" {
  name                = var.Backend_westeu["srv-name"]
  location            = azurerm_resource_group.rg-master.location
  resource_group_name = azurerm_resource_group.rg-master.name

  administrator_login          = var.Backend_westeu["administrator_login"]
  administrator_login_password = var.Backend_westeu["administrator_login_password"]

  sku_name   = var.Backend_westeu["sku_name"]
  storage_mb = var.Backend_westeu["storage_mb"]
  version    = var.Backend_westeu["version"]

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = var.Backend_westeu["tls"]
}

resource "azurerm_mysql_database" "master_db" {
  name                = var.Backend_westeu["DB-name"]
  resource_group_name = azurerm_resource_group.rg-master.name
  server_name         = azurerm_mysql_server.master_srv.name
  charset             = var.Backend_westeu["charset"]
  collation           = var.Backend_westeu["collation"]
}


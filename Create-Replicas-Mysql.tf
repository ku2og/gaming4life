resource "azurerm_resource_group" "rg-replica" {
  location = var.Backend_centralus_replica["location"]
  name     = var.Backend_centralus_replica["rg-name"]
}


resource "azurerm_mysql_server" "server_replica" {
  auto_grow_enabled                = true
  backup_retention_days            = 7
  infrastructure_encryption_enabled = true
  create_mode                      = "Replica"
  geo_redundant_backup_enabled     = true
  location                         = var.Backend_centralus_replica["location"]
  name                             = var.Backend_centralus_replica["srv-name"]
  public_network_access_enabled    = false
  resource_group_name              = azurerm_resource_group.rg-replica.name
  sku_name                         = var.Backend_centralus_replica["sku_name"]
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = var.Backend_centralus_replica["tls"]
  storage_mb                       = var.Backend_centralus_replica["storage_mb"]
  version                          = var.Backend_centralus_replica["version"]
  creation_source_server_id        = azurerm_mysql_server.master_srv.id
}
# Create Traffic Manager API Profile
resource "azurerm_traffic_manager_profile" "traffic-manager" {
  name                   = "tm-global-contoso-${var.environment}"
  resource_group_name    = "${azurerm_resource_group.rg-master.name}"
  traffic_routing_method = "Performance"

  dns_config {
    relative_name = "tm-global-contoso-${var.environment}"
    ttl           = 300
  }

  monitor_config {
    protocol = "http"
    port     = 80
    path     = "/"
  }
}


# Create Traffic Manager - West EU
resource "azurerm_traffic_manager_endpoint" "tm-endpoint-westEU" {
  name                = var.tfm-westEU["name"]
  resource_group_name = "${azurerm_resource_group.rg-master.name}"
  profile_name        = "${azurerm_traffic_manager_profile.traffic-manager.name}"
  type                = var.tfm-westEU["type"]
  target              = var.tfm-westEU["target"]
  endpoint_location   = azurerm_api_management.apim-westEU.location
}

# Create Traffic Manager - East End Point
resource "azurerm_traffic_manager_endpoint" "tm-endpoint-centralUS" {
  name                = var.tfm-centralUS["name"]
  resource_group_name = "${azurerm_resource_group.rg-master.name}"
  profile_name        = "${azurerm_traffic_manager_profile.traffic-manager.name}"
  type                = var.tfm-centralUS["type"]
  target              = var.tfm-centralUS["target"]
  endpoint_location   = azurerm_api_management.apim-westEU.additional_location[0].location
}
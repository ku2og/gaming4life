resource "azurerm_api_management" "apim-westEU" {
  name                = var.apim["name"]
  location            = azurerm_resource_group.rg-master.location
  resource_group_name = azurerm_resource_group.rg-master.name
  publisher_name      = var.apim["publisher_name"]
  publisher_email     = var.apim["publisher_email"]

  additional_location {
    location = var.apim["location"]
  }
  sku_name = var.apim["sku_name"]

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML

  }
}
variable "environment" {
    type = string
    default ="prod"
}

variable "rg_backend-ceUS" {
    type = string
    default ="rg-backend-ceUS"
}

variable "Backend_westeu" {
    type = map
    default = {
        "rg-name" = "rg-backend-westEU"
        "DB-name" = "mysql-master-game4life"
        "srv-name" = "mysqlsrvmastergame4life"
        "location" = "westeurope"
        "sku_name" = "GP_Gen5_8"
        "storage_mb" = 51200
        "version"= "5.7"
        "charset" = "utf8"
        "collation" = "utf8_unicode_ci"
        "public_network_access_enabled" = "false"

        "administrator_login" = "mysqladmin"
        "administrator_login_password" = "Espoir123."

        sku_name   = "GP_Gen5_8"
        storage_mb = 5120
        version    = "5.7"
        "tls" = "TLS1_2"
    }
}

variable "Backend_centralus_replica" {
    type = map
    default = {
        "rg-name" = "rg-backend-centralus"
        "DB-name" = "mysql-master-game4life"
        "srv-name" = "mysqlsrvreplicagame4life"
        "location" = "centralus"
        "sku_name" = "GP_Gen5_8"
        "storage_mb" = 51200
        "version"= "5.7"
        "charset" = "utf8"
        "collation" = "utf8_unicode_ci"
        "public_network_access_enabled" = "false"

        "administrator_login" = "mysqladmin"
        "administrator_login_password" = "Espoir123."

        sku_name   = "GP_Gen5_8"
        storage_mb = 5120
        version    = "5.7"
        "tls" = "TLS1_2"

    }
}


variable "apim" {
    type = map
    default = {
        "name" = "api-management-westEU"
        "publisher_name" = "game4life"
        "publisher_email" = "isaac.stephane3@gmail.com"
        "location" = "centralus"
        "sku_name" = "Premium_1"


    }
}

variable "fapp_ceUS" {
    type = map
    default = {
        "name" = "safunctionappceus"
        "account_tier" = "Standard"
        "account_replication_type" = "LRS"
        "location" = "centralus"
        "sku_name" = "Premium_1"

        "plan_name" = "aspceUS"
        "kind" = "Linux"
        "sku_tier" = "Dynamic"
        "sku_size" = "Y1"

        "fap_name" = "fa-ceUS"
        "os_type" = "linux" 
    }
}

variable "fapp_westEU" {
    type = map
    default = {
        "name" = "safunctionappwesteu"
        "account_tier" = "Standard"
        "account_replication_type" = "LRS"
        "location" = "centralus"
        "sku_name" = "Premium_1"

        "plan_name" = "asp-westEU"
        "kind" = "Linux"
        "sku_tier" = "Dynamic"
        "sku_size" = "Y1"

        "fap_name" = "fa-westEU"
        "os_type" = "linux" 
    }
}

variable "tfm-westEU" {
    type = map
    default = {
        "name" = "API Manager Game4life West EU"
        "type" = "externalEndpoints"
        "target" = "api-management-westeu-westeurope-01.regional.azure-api.net"
    }
}


variable "tfm-centralUS" {
    type = map
    default = {
        "name" = "API Manager Game4life Central US"
        "type" = "externalEndpoints"
        "target" = "api-management-westeu-centralus-01.regional.azure-api.net"
    }
}



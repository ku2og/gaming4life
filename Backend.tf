terraform {
  backend "azurerm" {
    storage_account_name = "esgiterraformbackend"
    container_name       = "gaming4lifebackend"
    key                  = "backend.terraform.tfstate"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "rlcoelv3FsNreT6avwgKY06l7kb/b6RE1m6/4hU7GI30Oc3UqUhHXhV34lZ4yxGmFeM0HkCxND39BZA8u+PlTw=="
  }
}
resource "azurerm_data_protection_backup_vault" "data-protection-bkp-vault" {
  name                = "${var.current-name-convention-core-public-module}-dp-bkp-vault"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  datastore_type      = "VaultStore"
  redundancy          = "LocallyRedundant"
  tags = "${var.tags-BCDR-module}"
  depends_on = [var.azbcdr_depend_on_module]
}


# Azure Service recovery vault works with VM for example, in the below we will create the service recovery vault and a default  backup oilcy for VM . 
resource "azurerm_recovery_services_vault" "recovery-srvc-vault" {
  name                = "${var.current-name-convention-core-public-module}-recovery-srvc-vault"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  sku                 = "Standard"
  storage_mode_type = "LocallyRedundant"
  soft_delete_enabled = false 
  tags = "${var.tags-BCDR-module}"
  depends_on = [var.azbcdr_depend_on_module]
}

resource "azurerm_backup_policy_vm" "recovery-srvc-vault-policy" {
  name                = "${var.current-name-convention-core-public-module}-recovery-srvc-vault-policy"
  resource_group_name      = "${var.module-resource-module-rg}"
  recovery_vault_name = azurerm_recovery_services_vault.recovery-srvc-vault.name  
  timezone = "UTC"
  depends_on = [var.azbcdr_depend_on_module]
  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 10
  }
  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }
  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }
  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}


output "hub-corpc-log-ana-rep-id" {
  value = "${azurerm_log_analytics_workspace.hub-corpc-log-ana-rep.id}"
}
output "hub-corpc-log-ana-rep-primary-key" {
  value = "${azurerm_log_analytics_workspace.hub-corpc-log-ana-rep.primary_shared_key}"
}
output "hub-corpc-log-ana-rep-primary-workspace-id" {
  value = "${azurerm_log_analytics_workspace.hub-corpc-log-ana-rep.workspace_id}"
}

output "hub-corpc-ev-hb-1-id" {
  value = "${azurerm_eventhub_authorization_rule.hub-corpc-ev-hb-1-rule-1.id}"
}
output "hub-corpc-ev-hb-1-pri-conx-string" {
  value = "${azurerm_eventhub_authorization_rule.hub-corpc-ev-hb-1-rule-1.primary_connection_string}"
}
output "hub-corpc-ev-hb-1-pri-conx-key" {
  value = "${azurerm_eventhub_authorization_rule.hub-corpc-ev-hb-1-rule-1.primary_key}"
}
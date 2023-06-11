# LZv2
deploying an Azure Landing zone using modules 

1 - create a SPN with subscription scope

2 - copy the SPN's details in the variable.tf file. 

    # Create service principal
    
    $spCredentials = az ad sp create-for-rbac --name SP_1 | ConvertFrom-Json

    # Get SP details
    $spDetails = az ad sp show --id $spCredentials.appId | ConvertFrom-Json

# Create contributor role assignment for subscription1
az role assignment create --assignee-principal-type ServicePrincipal --assignee-object-id $spDetails.id --role "contributor" --scope /subscriptions/mySubscriptionID_of_Subscription_1

# Create network contributor role assignment for subscription1
az role assignment create --assignee-principal-type ServicePrincipal --assignee-object-id $spDetails.id --role "network contributor" --scope /subscriptions/mySubscriptionID_of_Subscription_1

# Create contributor role assignment for subscription2
az role assignment create --assignee-principal-type ServicePrincipal --assignee-object-id $spDetails.id --role "contributor"--scope /subscriptions/mySubscriptionID_of_Subscription_2

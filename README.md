# LZv2 Deploying an Azure Landing zone using modules 

1 - create a SPN for each subscription scope

    az ad sp create-for-rbac --name SP_iac_1  --role contributor  --scopes /subscriptions/subscription_id_1
    az ad sp create-for-rbac --name SP_iac_2  --role contributor  --scopes /subscriptions/subscription_id_2
    az ad sp create-for-rbac --name SP_iac_3  --role contributor  --scopes /subscriptions/subscription_id_3

2 - Copy the SPN's details in the variable.tfvars file. Note that the default provider will also have the SP_iac_1 details as this is fo rthe HUB


3 - Start the script 



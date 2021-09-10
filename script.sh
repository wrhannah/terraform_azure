git clone https://github.com/wrhannah/terraform_azure.git terraformlab
cd terraformlab
az login -u student-483-866822@labscloudacademy.onmicrosoft.com -p Ca1_two42F48
rg=cal-483-80
az storage account create --name sasacal15143b88 --resource-group $rg --location westus --sku Standard_LRS --encryption-services blob
az storage container create --name calab --account-name sasacal15143b88 --auth-mode login
az storage account blob-service-properties update -n sasacal15143b88 --enable-change-feed true --enable-versioning true
terraform init
terraform import azurerm_resource_group.example /subscriptions/c460cd3f-7c2a-48cc-9f5d-b62d6083ec23/resourceGroups/cal-483-80
terraform plan -out main.tfplan
terraform apply main.tfplan

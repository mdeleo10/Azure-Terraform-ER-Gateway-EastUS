# Azure-Terraform-VPNGW-Hub-EastUS

This Azure Terraform template creates in Azure an Express Gateway circuit


It has the following variables defined in the file variables.rf
- Resource Group Name
- Resource Region Location


## Prerequistes:

Action Secrets:
- AZURE_AD_CLIENT_ID (Service Principal)
- AZURE_AD_CLIENT_SECRET (Service Principal Password)
- AZURE_AD_TENANT_ID
- AZURE_SUBSCRIPTION_ID

### Note: The Service Principal needs to have the RBAC rights over the subscription to 
- Create a Resource Group
- Create A Vnet and subnet
- Create Public IP address
- Create NSG
- Create a VPNGW and Local Network Gateway

### Note 2: Also needed access to the existing Resource Group rg-terraform-state-001 for the following:
- Storage Account and IAM access, for example contributor, for cloudmdterraformstate in RG rg-terraform-state-001.
- Key Vault kv-terraform-script-001 in RG rg-terraform-state-001, with secret "sshIDpub" in the ssh public key string format example "ssh-rsa KKKKKKeyKKKKK userid@xxx.com". Note need to add IAM access, for example Key Vault Administrator to access and read keys 

### See     .github/workflows/terraform.yml file for Action execution

### Note on deployment time: Creating a virtual network gateway can take up to **30 minutes** to complete.

### Post VPN Gateway creation

- Once the ExpressRoute circuit is successfully created, need to follow activation with the partner or provider. Provide the service key to them.

## For Point-to-Site use, see ..


# References:
- [Azure Express Route ](https://learn.microsoft.com/en-us/azure/expressroute/)
- [Azure Cloud Adoption Framework - Enterprise Scale Landing Zone Architecture](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone)
- [Terraform Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/point_to_site_vpn_gateway)
- [Virtual network Gateway](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways)
- [Terraform AzureRM Provider Documentation](https://www.terraform.io/docs/providers/azurerm/index.html)
- https://github.com/kumarvna/terraform-azurerm-vpn-gateway/


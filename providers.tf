provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
    subscription_id = "f44228c9-ddfe-4830-a404-e9ef17469178"
    client_id = "f899f565-23aa-40e7-a50e-8623b6f97f9f"
    client_secret = "OSz-3hcbuz5V6OM7.OH6~CuX4g-l2iV1--"
    tenant_id = "f583415f-294d-4c12-ad25-8b06cb6bd39b"
}

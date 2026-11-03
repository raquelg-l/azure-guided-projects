# Terraform: Static Website with Azure Blob Storage

The same infrastructure as the [portal walkthrough](../portal/), written as code. One configuration covers the resource group, storage account, static website hosting and the file uploads (portal exercises 01 to 03), plus teardown (exercise 05).

## Files

| File | Purpose |
|------|---------|
| `providers.tf` | Terraform and provider versions (`azurerm ~> 5.0`) |
| `variables.tf` | Resource group name, region and storage account name |
| `main.tf` | The resources |
| `outputs.tf` | Public endpoint and account name |
| `.terraform.lock.hcl` | Exact provider version used (committed on purpose) |

The HTML files are not duplicated: Terraform uploads the ones in [`../site/`](../site/).

## Portal task to Terraform resource

| Portal | Terraform |
|--------|-----------|
| Exercise 01, Task 1: resource group | `azurerm_resource_group` |
| Exercise 01, Task 2: storage account (Standard, LRS) | `azurerm_storage_account` |
| Exercise 01, Task 3: enable static website | `azurerm_storage_account_static_website` |
| `$web` container (created by Azure) | `data.azurerm_storage_container` (read-only) |
| Exercise 02 and 03: upload and update files | `azurerm_storage_blob` with `for_each` over two files |
| Exercise 05: delete the resource group | `terraform destroy` |

## Run it

```powershell
az login
$env:ARM_SUBSCRIPTION_ID = az account show --query id -o tsv
cd 01-static-website-blob\terraform
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

Authentication uses the Azure CLI session. The subscription ID is passed through an environment variable and is never written to a file.

## Results

```text
Plan: 5 to add, 0 to change, 0 to destroy.
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

primary_web_endpoint = "https://stgpstaticsitergl13.z1.web.core.windows.net/"
storage_account_name = "stgpstaticsitergl13"
```

Provider version installed: `hashicorp/azurerm v5.12.0`.

**Verification**

- The root URL serves **Version 2 - Landing Page**.
- A missing path returns `HTTP/1.1 404` with the custom page as the body.
- `index.html` reports `"contentType": "text/html"` and `"tier": "Hot"`, the same as the portal build.
- A second `terraform plan` reported `No changes. Your infrastructure matches the configuration.` (idempotent).
- `terraform destroy` removed all five resources, and `az group exists` returned `false`.

## Design notes

- **`$web` is read, not created.** Azure creates the container itself when static website hosting is enabled, so a data source reads it, with `depends_on` to wait for the static website setting.
- **`content_type = "text/html"` is explicit.** Without it the blob is stored with a generic type and browsers download the page instead of rendering it.
- **`content_md5 = filemd5(...)`** makes Terraform re-upload a file whenever its contents change, which replaces the manual "overwrite" upload of Exercise 03.
- **State is local and not committed.** The state file contains the storage account keys, so `.gitignore` excludes `*.tfstate` and `.terraform/`.

## Notes and issues

- Right after `apply`, the root URL briefly returned `WebsiteDisabled`. The setting takes a few seconds to propagate. Retrying a short time later served the page.
- The Terraform version deploys the current content (Version 2). The Version 1 to Version 2 history is in Git.
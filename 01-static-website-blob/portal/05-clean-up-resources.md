# Exercise 05: Clean Up Resources

**Outcome:** every resource created for the project is deleted, so nothing keeps billing the subscription.

## Task 1: Delete the resource group

Before deleting, checked that the resource group held only the resources created for this project:

```powershell
az resource list --resource-group rg-gp-static-website --query "[].{name:name, type:type}" -o table
```

```text
Name                 Type
-------------------  -------------------------------
stgpstaticsitergl13  Microsoft.Storage/storageAccounts
```

Then, in the portal: **Resource groups → `rg-gp-static-website` → Delete resource group**, typed the group name to confirm, and confirmed again. Deleting the group removes everything inside it, including the storage account and the `$web` container. The site files remain in the repository (`site/`).

## Task 2: Verify cleanup

```powershell
az group exists --name rg-gp-static-website
```

```text
false
```

```powershell
curl.exe -I https://stgpstaticsitergl13.z1.web.core.windows.net/
```

```text
curl: (6) Could not resolve host: stgpstaticsitergl13.z1.web.core.windows.net
```

The group no longer exists and the public endpoint no longer resolves.

## Validation

- [x] `rg-gp-static-website` no longer exists
- [x] The primary endpoint URL no longer resolves

## Notes

- Deletion is permanent. Git holds the content, and the infrastructure can be recreated, which is what the Terraform version of this project does.
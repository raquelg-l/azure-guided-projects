# Exercise 01: Create Storage Account and Enable Hosting

**Outcome:** a storage account with static website hosting enabled and a public endpoint ready to serve content, even though no files are uploaded yet.

| Item | Value |
|------|-------|
| Resource group | `rg-gp-static-website` |
| Region | Germany West Central (`germanywestcentral`) |
| Storage account | _TODO_ |
| Performance / redundancy | Standard / LRS |
| Primary endpoint | _TODO_ |

## Task 1: Prepare the environment

Create a resource group to hold every resource of the project, so cleanup is a single deletion at the end:

1. Signed in to the Azure portal with the student account.
2. Searched for **Resource groups** and selected **+ Create**.
3. Named the group `rg-gp-static-website` and selected **Germany West Central** as the region.
4. Ran **Review + create**, got "Validation passed", then selected **Create**.

**Region choice:** the Azure for Students subscription restricts which regions can be used, so the region was picked from the allowed list rather than by proximity. This region is reused for every resource in the project.

**Verification:** the group appears in the portal, and the CLI confirms it:

```powershell
az group show --name rg-gp-static-website --query "{name:name, location:location, state:properties.provisioningState}" -o table
```

```text
Name                  Location            State
--------------------  ------------------  ---------
rg-gp-static-website  germanywestcentral  Succeeded
```

**Why a resource group?** It groups every resource of the project, so the cleanup exercise only needs to delete this one object.

![Resource group review page](./screenshots/01-resource-group-review.png)

## Task 2: Create the storage account

Created a general-purpose storage account.

| Setting | Choice | Reason |
|---------|--------|--------|
| Performance | Standard | Cheapest option, enough for a static page |
| Redundancy | LRS | Three copies in one datacenter, lowest cost |
| Name | _TODO_ | Must be globally unique, 3-24 lowercase letters and digits |

_TODO: describe anything unexpected._

![Storage account basics](./screenshots/02-storage-account-basics.png)
![Deployment complete](./screenshots/03-deployment-complete.png)

## Task 3: Enable static website hosting

Enabled the static website feature, which creates the `$web` container, and set:

- Index document: `index.html`, served at the root URL
- Error document: `404.html`, served for paths that don't exist

_TODO: note the primary endpoint URL shown after saving._

![Static website enabled](./screenshots/04-static-website-enabled.png)

## Validation

- [ ] Static website shows **Enabled**
- [ ] A **primary endpoint URL** is displayed

## Notes and issues

_TODO: anything worth mentioning._
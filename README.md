# Azure Guided Projects

Hands-on practice with Microsoft Azure, based on the Microsoft Learn path
[Introduction to cloud infrastructure: apply Azure skills (guided projects)](https://learn.microsoft.com/en-us/training/paths/introduction-cloud-infrastructure-apply-azure-skills-guided-projects/).

Each project is completed **twice**:

1. **Azure portal**: following the guided steps through the graphical interface, documented with screenshots and notes.
2. **Terraform**: rebuilding the same infrastructure as code, to practice Infrastructure as Code (IaC) and professional Git workflows.

## Projects

| # | Project | Portal | Terraform | Status |
|---|---------|:------:|:---------:|--------|
| 01 | [Deploy a static website with Azure Blob Storage](./01-static-website-blob/) | Pending | Pending | In progress |

## Repository structure

```text
azure-guided-projects/
├── README.md
├── LICENSE
├── .gitignore
└── 01-static-website-blob/
    ├── README.md      # objective, steps, validation and lessons learned
    ├── portal/        # screenshots and notes from the portal run
    ├── terraform/     # Terraform configuration
    └── site/          # HTML files shared by both approaches
```

Every new project follows the same layout.

## Tools

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Terraform](https://developer.hashicorp.com/terraform)
- [Git](https://git-scm.com/) and GitHub
- PowerShell on Windows

## Workflow

- `main` always contains finished, working content.
- Work happens on short-lived branches named `type/description` (for example `docs/01-portal-walkthrough`, `feat/01-terraform`).
- Every change goes through a Pull Request, merged with squash.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/).
- Terraform state files and variable files are never committed (see `.gitignore`).

## Cost and cleanup

Everything is built on an Azure for Students subscription. Resources are deleted at the end of each project to avoid unnecessary charges.

## License

Released under the [MIT License](./LICENSE).
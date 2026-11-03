# Exercise 04: Validate Success

Review of the six success criteria for Project 01, each linked to the evidence collected during the exercises.

| # | Criterion | Result | Evidence |
|---|-----------|:------:|----------|
| 1 | Storage account created with static website hosting **Enabled** and a **Primary endpoint URL** displayed | Pass | [Exercise 01, Task 3](./01-create-storage-and-hosting.md#task-3-enable-static-website-hosting), screenshot `ex01-04` |
| 2 | The `$web` container contains both `index.html` and `404.html` | Pass | [Exercise 02, Task 3](./02-upload-and-verify-content.md#task-3-create-and-upload-a-custom-error-page), screenshot `ex02-02` |
| 3 | The landing page displayed **Version 1 - Landing Page** when first published | Pass | [Exercise 02, Task 4](./02-upload-and-verify-content.md#task-4-verify-the-live-site-and-error-page), screenshot `ex02-03` |
| 4 | A nonexistent path shows the custom **404 - Page Not Found** page | Pass | Same section, screenshot `ex02-04`, plus the `curl` GET showing status 404 with the custom HTML |
| 5 | The updated **Version 2 - Landing Page** is visible on the live site | Pass | [Exercise 03, Task 3](./03-update-site-content.md#task-3-verify-the-updated-site), screenshot `ex03-01` |
| 6 | Both blobs show content type `text/html` and access tier `Hot` | Pass | [Exercise 03, Task 4](./03-update-site-content.md#task-4-review-blob-properties-and-access-tier), screenshots `ex03-02` and `ex03-03`, plus CLI output |

## Notes

- Criterion 3 is historical evidence: once Version 2 replaced the file, the live site no longer shows Version 1. The screenshot taken during Exercise 02 is the proof.
- Criterion 6 reports `Hot (Inferred)` in the portal. The blobs have no tier set explicitly and inherit the account default.
- A final CLI check was run before cleanup to confirm the site was still serving Version 2 and the missing path still returned 404.
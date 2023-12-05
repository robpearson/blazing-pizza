Our CI/CD pipeline consists of the following best of breed tools.

* Jira
* GitHub Repo + GitHub Actions
* Octopus Deploy 

We manage work in Jira, commit to GitHub repositories and build and test our applications with GitHub Actions. Our GitHub Actions CI Process builds our container images, pushing to an Azure Container Registry and creates a linked release in Octopus Deploy.
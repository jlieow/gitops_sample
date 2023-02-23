## Contributor guide

In this guide you will get an overview of the contribution workflow from creating a PR, reviewing, and merging the PR.

---

## Getting started

### Terraform Conventions:

Follow the Best practices for using Terraform:
https://cloud.google.com/docs/terraform/best-practices-for-terraform

### Branches

The following are the branch naming conventions to be followed.
Folders which contain terraform configuration files are known as terraform roots

#### infra

convention: infra/{terraform root}
convention: infra/{directory}/{terraform root}

#### fix

convention: fix/{terraform root}
convention: fix/{directory}/{terraform root}

#### chaos_test

convention: chaos_test/{terraform root}
convention: chaos_test/{directory}/{terraform root}

#### documentation

convention: documentation/
convention: documentation/{terraform root}
convention: documentation/{directory}/{terraform root}

#### release

convention: release/v{X}.{Y}.{Z}<br/>

X - Major
Y - Minor
Z - Patch

### GitOps

Tags will be used to trigger workflows for terraform provisioning and drift checks<br/>

Convention to trigger Terraform apply: {prod/staging}\_{dir}\_v{X}.{Y}.{Z}
Convention to trigger drift check: drift\_{dd/MM/yyyy HH:mm}<br/>

### Overview of Contribution Process

#### Day 0

1. Create repo from main branch. For example:

`infra/aegis`

2. This means you are going to be contributing a terraform root named aegis into the root directoryof the repo.

3. After terraform testing and completion, you may want to merge. This repo adopts the [rebase](https://www.atlassian.com/git/tutorials/merging-vs-rebasing#:~:text=The%20Rebase%20Option&text=But%2C%20instead%20of%20using%20a,commits%20required%20by%20git%20merge%20.) process for merging.

    - Rebase from main
    - If you run into any merge issues, checkout this [git tutorial](https://github.com/skills/resolve-merge-conflicts) to help you resolve merge conflicts and other issues.
    - Create [Pull Request](#pull-requests) in order to merge to main

4. To deploy to prod/staging use tagging convention mentioned earlier.
5. To conduct drift check use tagging convention mentioned earlier.

#### Pointers for Pull Requests and Merging

1. Only when your terraform root can be taken over immediately, is your commit ready for a pull request.

2. Please clearly define the changes made into your pull requests and highlight the thinking process. For example, why did you create the module with 2 VMs instead of 1, or why did the module contain 2 subnets with one VPC instead of separating them.

3. Variables.tf files in the root folder require descriptions and explanations as people taking over will need to modify related tfvars files. Missing or unclear explanations will mean they would have to take time to deep dive into your terraform root to understand its use and cut down on its reusability.

4. Always include a diagram of the architecture your terraform root will deploy in the README.MD so that people taking over will have a clear idea of what will be deployed.

5. Value readability over cleverness.

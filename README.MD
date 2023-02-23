AWS Hub contains the hub architecture.

---

## Directory

The repo and respective directories should adhere to the following directory structure.

#### Repo directory

    .
    ├── .github                         # Location of workflow files
    │   └── workflows                   # Contains GitHub workflows which run your CICD
    │           └── chatops_workflow    # Contains ChatOps CICD
    │           └── gitops_workflow     # Contains GitOps CICD
    ├── _docs_                          # Contains documentation to various tools we will be using with CICD and each terraform root
    ├── _samples                        # Contains sample to reference from
    ├── user1                           # User folder for new contributors to learn the repo standards
    │   └── terraform_root_ec2          # Terraform root that contains their terraform config files and readme
    ├── gitops_ec2                      # Terraform root ready for use in GitOps
    ├── chatops_ec2                     # Terraform root ready for use in ChatOps
    ├── CONTRIBUTING.MD                 # Describes expected contributing standards for this repo
    └── README.MD                       # Current file

#### A typical terraform root directory layout with workflow

    .
    ├── config                # Terraform Manager and Terraformx CLI locates all your tfvars files in the root directory and combines them into a settings.tfvars file here.
    │   └── settings.tfvars   # Values in backend.tfvars and config.tfvars will be stored here
    ├── modules               # Location of Terraform modules.
    ├── workflow
    │   └── config.yaml       # Terraform Manager and Terraformx CLI will detect the yaml file and invoke terraform commands on targeted modules and resources.
    ├── backend.tf            # Tells Terraform where to store the Terraform state file.
    ├── main.tf               # Terraform main.tf.
    ├── output.tf             # Outputs values after provisioning resources.
    ├── variables.tf
    ├── backend.tfvars        # Variables to be used by backend.tf. This will be picked up by Terraform Manager and Terraformx CLI and placed into /config
    ├── config.tfvars         # Variables to be used by Terraform when provisioning your resources. This will be picked up by Terraform Manager and Terraformx CLI and placed into /config
    └── README.md             # Describes the architecture that your terraform root will provision. Please include architecture diagram

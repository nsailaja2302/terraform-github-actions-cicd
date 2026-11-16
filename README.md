# Terraform + AWS + GitHub Actions CI/CD

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform and CI/CD automation using GitHub Actions to manage AWS infrastructure.

It uses GitHub Actions with AWS OpenID Connect (OIDC) authentication to securely authenticate with AWS without storing long-lived AWS access keys in GitHub.

## Project Objectives

- Automate Terraform code validation through GitHub Actions.
- Execute Terraform formatting and validation checks.
- Generate Terraform execution plans through CI/CD.
- Configure secure AWS authentication using GitHub OIDC.
- Manage AWS infrastructure using Terraform.
- Follow a version-controlled Infrastructure as Code approach.

## Technology Stack

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| AWS | Cloud infrastructure |
| GitHub | Source code management |
| GitHub Actions | CI/CD automation |
| AWS IAM | Identity and access management |
| AWS OIDC | Secure GitHub-to-AWS authentication |
| Amazon S3 | Terraform remote state storage |
| Amazon DynamoDB | State locking for this practice setup |

## Architecture Overview

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions Workflow
    |
    +----------------------+
    | Terraform Formatting |
    | Terraform Init      |
    | Terraform Validate  |
    +----------------------+
    |
    v
AWS OIDC Authentication
    |
    v
AWS IAM Role
    |
    v
Terraform Plan
    |
    v
AWS Infrastructure
```

## CI/CD Workflow

The GitHub Actions workflow is configured to run on:

- Pull requests targeting the main branch.
- Pushes to the main branch.
- Manual execution using workflow dispatch.

The pipeline includes:

1. **Terraform Setup** – Installs the required Terraform version.
2. **Terraform Format** – Checks Terraform formatting.
3. **Terraform Init** – Initializes the Terraform working directory.
4. **Terraform Validate** – Validates the Terraform configuration.
5. **AWS Authentication** – Uses GitHub OIDC to assume an AWS IAM role.
6. **Terraform Plan** – Generates an execution plan for infrastructure changes.

Note: Terraform plan and apply are different operations. This project documents the validation and planning workflow; infrastructure deployment was performed as part of the practice exercise.

## AWS Authentication Using OIDC

This project uses AWS IAM OIDC federation to allow GitHub Actions to assume an AWS IAM role.

Benefits:

- No long-lived AWS access keys stored in GitHub.
- Temporary credentials are obtained through role assumption.
- Access is controlled through IAM trust and permission policies.
- Supports a more secure CI/CD authentication approach.

## Terraform Remote State

For this practice project:

- An Amazon S3 bucket was created manually for Terraform remote state.
- A DynamoDB table was created manually for state locking.
- Terraform was configured to use the remote backend.

The backend resources were pre-created for this exercise and were not provisioned by the Terraform project itself.

## AWS Configuration

- AWS Region: `ap-south-1`
- Terraform Version: `1.6.6`
- Authentication: GitHub Actions with AWS OIDC

## Security Practices

- Avoid storing AWS access keys in source code.
- Use GitHub secrets for non-sensitive configuration where needed.
- Use IAM roles with least-privilege permissions.
- Never commit Terraform state files or sensitive variable files.
- Restrict the AWS IAM role trust policy to the intended GitHub repository and branch.

## Key Learnings

- Terraform Infrastructure as Code.
- Terraform initialization, formatting, validation and planning.
- GitHub Actions workflow structure.
- CI/CD pipeline implementation.
- AWS IAM roles and OIDC federation.
- Terraform remote state and state locking.
- Secure cloud automation practices.

## Future Improvements

- Add an automated Terraform apply workflow with appropriate approval controls.
- Provision remote backend resources through a separate Terraform configuration.
- Add automated security and static analysis checks.
- Improve workflow notifications and error handling.

---

**Author:** Independent Terraform and AWS learning project

**Repository:** [terraform-github-actions-cicd](https://github.com/nsailaja2302/terraform-github-actions-cicd)

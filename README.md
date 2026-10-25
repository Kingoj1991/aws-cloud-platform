# SentinelOps AWS Cloud Platform

A hands-on AWS infrastructure project built with Terraform and
tracked with Git. This repository documents my cloud engineering
practice, configuration changes, and validation results.

## Current Configuration

The Terraform code defines an AWS Virtual Private Cloud (VPC).
Its IPv4 network range is configurable through an input variable,
with a default of `10.0.0.0/16`.

## Project Files

| File | Purpose |
| --- | --- |
| `main.tf` | Terraform provider configuration and AWS VPC resource |
| `variables.tf` | Input variables for configurable infrastructure settings |
| `.gitignore` | Excludes local Terraform files, state, and sensitive files |
| `.terraform.lock.hcl` | Records provider dependency selections |
| `README.md` | Project overview and lab documentation |

## Day 1: Terraform and GitHub Setup

### Work Completed
- Set up Terraform and Git on Windows 11.
- Initialized the Terraform project and validated its configuration.
- Configured `.gitignore` to exclude Terraform state, downloaded providers, variable value files, and credentials.
- Initialized a Git repository and connected it to GitHub.
- Committed and pushed the initial project files.

### What I Learned
- `terraform init` prepares a directory and installs required providers.
- `terraform fmt` standardizes Terraform code formatting.
- `terraform validate` checks configuration syntax and internal consistency.
- `git add` stages changes for a commit.
- `git commit` records a version locally.
- `git push` uploads local commits to GitHub.

## Day 2: Terraform Input Variables

### Work Completed
- Created `variables.tf`.
- Declared a string input variable named `vpc_cidr`.
- Set its default value to `10.0.0.0/16`.
- Updated the VPC resource to use `var.vpc_cidr`.
- Reviewed working and staged changes using Git.

### Before
```hcl
cidr_block = "10.0.0.0/16"
```

### After
```hcl
cidr_block = var.vpc_cidr
```

### Why This Change Matters
Input variables separate configurable values from resource
definitions. This allows the same Terraform code to be reused
with different network ranges without editing the VPC resource.

### Validation
- `terraform validate` returned a successful result.
- Reviewed the code change with `git diff`.
- Reviewed both staged Terraform files with `git diff --cached`.

### What I Learned
Terraform loads `.tf` files in the same module directory together.
The variable declaration must be saved in that directory so
Terraform can resolve `var.vpc_cidr`.

Git distinguishes between modified, untracked, and staged files.
Staging selects the changes that will be included in a commit.

## Deployment Status

The configuration has been validated. Validation does not create
AWS resources or confirm that a deployment will succeed.
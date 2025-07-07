# GitHub Actions Migration

This project is a migration from an Azure DevOps pipeline to a GitHub Actions workflow for managing infrastructure using Terraform.

## Purpose

The primary goal of this migration is to leverage GitHub Actions for continuous integration and continuous deployment (CI/CD) of infrastructure as code (IaC) using Terraform. This allows for a more streamlined and integrated workflow within the GitHub ecosystem.

## Project Structure

- **.github/workflows/main.yml**: This file defines the GitHub Actions workflow, including jobs for setting up the environment, installing Terraform, initializing Terraform, validating configurations, planning, applying, and destroying infrastructure.
  
- **pipeline.yml**: This file contains the original Azure DevOps pipeline configuration, outlining the stages, jobs, and steps for deploying infrastructure using Terraform.

## Usage

To use the GitHub Actions workflow:

1. Ensure that you have the necessary secrets configured in your GitHub repository for Azure authentication and Terraform variables.
2. Push changes to the `main` branch to trigger the workflow.
3. Monitor the Actions tab in your GitHub repository for the status of the workflow runs.

## Contributing

Contributions to improve the workflow or documentation are welcome. Please submit a pull request with your changes.
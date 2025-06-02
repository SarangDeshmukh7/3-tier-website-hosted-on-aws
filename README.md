# 3-Tier Website Hosted on AWS

This repository demonstrates the deployment of a scalable, secure, and highly available 3-tier web application architecture on **Amazon Web Services (AWS)** using **Terraform**.

**I developed this project solely for learning Terraform and gaining hands-on experience with AWS infrastructure. All components are provisioned using Infrastructure as Code (IaC) principles, demonstrating how to manage cloud infrastructure efficiently and reproducibly using Terraform.**

## Project Overview

The architecture is divided into three primary layers:

- **Web Tier**: Handles incoming HTTP/HTTPS requests using an Application Load Balancer (ALB) and routes them to the application tier.
- **Application Tier**: Processes business logic and serves dynamic content.
- **Database Tier**: Stores persistent data using Amazon RDS (MySQL).

This setup ensures modularity, scalability, and fault tolerance.

## Architecture Diagrams

## Overview Diagram

![image](https://github.com/user-attachments/assets/cce7bb37-627f-43ad-9b3e-e176fc7c5089)

## Enviroment Diagram

![image](https://github.com/user-attachments/assets/89b51fbe-d7d3-481b-82cb-70f7b34aa3c9)

## Final product on web browser 
### (Due to AWS cost considerations, the website is currently not live.)

![image](https://github.com/user-attachments/assets/6684de84-b7cb-4d6e-9d4d-d709a8695a6d)

## CI/CD Pipeline Architecture

This project sets up an automated infrastructure provisioning pipeline using **Terraform** and **AWS CodePipeline**, with two deployment environments: **Staging** and **Production**. A **Manual Approval** gate ensures changes are reviewed before reaching production.

### Components Explained

- **GitHub**  
  The source code repository. Pushing changes here automatically triggers the pipeline.

- **AWS CodePipeline**  
  Orchestrates the deployment workflow across stages: **Staging → Manual Approval → Production**.

- **Stag Deploy Stage**  
  - Uses **AWS CodeBuild** to provision infrastructure in the **Staging environment**.
  - Resources provisioned include:  
    - VPC  
    - EC2 with Auto Scaling  
    - NAT Gateway  
    - Application Load Balancer (ALB)  
    - Route 53  
    - AWS IAM  
    - Bastion Host  
    - AWS Certificate Manager  
    - SNS (for notifications)

- **Manual Approval Stage**  
  - An email is sent after staging deployment.
  - Requires manager approval before proceeding to production.
  - Adds a governance and validation checkpoint.

- **Prod Deploy Stage**  
  - Upon approval, **AWS CodeBuild** provisions the same infrastructure in the **Production environment**.
  - Ensures consistency between Staging and Production.

- **Terraform**  
  The entire infrastructure is defined and managed using **Infrastructure as Code** with Terraform, promoting automation and reproducibility.

- **Email Notifications**  
  - Managed using **SNS** and **CodePipeline notifications**.
  - Keeps managers informed after staging deployment and before production approval.

---

### Key Benefits

- Clear, structured deployment pipeline: **Staging → Approval → Production**
- Repeatable infrastructure setup using **Terraform modules**
- Built-in governance with **email-based manual approval**
- High confidence deployments via consistent staging-to-production flow



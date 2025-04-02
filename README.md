# Status Page Project

## What is a Status Page?
A **Status Page** is a web application that provides real-time information about the operational status of services, applications, or infrastructure. It allows users to monitor uptime, incidents, and maintenance activities, helping organizations communicate system health effectively. This project implements a **highly available, scalable, and secure Status Page infrastructure** on **AWS** using **Kubernetes (EKS)** and other AWS services.

## Project Overview
This project focuses on designing and deploying the **infrastructure and architecture** for an existing **Status Page** application on **AWS**. The deployment is fully containerized and runs on **Amazon EKS** with a **highly available RDS (Multi-AZ)** database. It also features **Argo CD** for continuous deployment, **GitHub Actions** for automation, and robust **monitoring and security measures**.

## Branch Structure
This project is organized into three main branches:
 - **Devops Branch**: Contains all files related to Docker and Argo CD configuration.
 - **Develop Branch**: Contains the application code, ensuring that developers only modify code within this branch.
 - **Master Branch**: Serves as the main branch, consolidating files from both Devops and Develop.

## Architecture
- **CI/CD**: GitHub Actions automates testing, security scanning, and deployment.
- **Containerization**: The application is packaged as a Docker container.
- **Orchestration**: Managed with **Amazon EKS**, using **Argo CD** for continuous deployment.
- **Database**: Uses **AWS RDS (Multi-AZ)** for high availability and redundancy.
- **Storage**: Implements **AWS EFS**, with separate access points for **staging** and **production**.
- **Container Registry**: Stores Docker images in **AWS ECR**.
- **Monitoring**: Integrated with **Prometheus & Grafana**.
- **Logging**: Centralized log management using **AWS CloudWatch**.

## Security Considerations
Security was a **primary focus** in designing the infrastructure. Key security measures include:
- **Private Subnets for Sensitive Resources**: RDS and EKS nodes reside in **private subnets**, ensuring restricted access.
- **Strict Security Group Rules**: Only necessary ports and protocols are allowed to reduce the attack surface.
- **Least Privilege IAM Policies**: IAM roles and policies follow the principle of **least privilege**.
- **EFS Access Restrictions**: Staging and production environments have **separate access points** to prevent cross-environment access.
- **Image Security Scanning**: Every new Docker image is scanned for vulnerabilities before deployment.
- **Automated Secrets Management**: AWS Secrets Manager (or similar) is used to store sensitive credentials securely.

## Deployment Workflow
1. A developer pushes changes to GitHub.
2. **GitHub Actions** triggers a CI/CD pipeline:
   - Builds a new Docker image.
   - Runs tests, including **curl-based health checks** and **RDS connectivity verification**.
   - Scans the image for security vulnerabilities.
   - Tags the image sequentially (e.g., version 1, version 2).
   - Pushes the image to **AWS ECR**.
3. **Argo CD** detects the new image and deploys it to the **staging namespace** in **EKS**.
4. After **QA approval**, Argo CD promotes the deployment to the **production namespace**.

## Infrastructure Components
- **Amazon EKS Cluster**: Orchestrates and manages containerized workloads.
- **Node Group**: Provides compute resources with access to **RDS**.
- **AWS RDS (Multi-AZ)**: Ensures database high availability and failover protection.
- **AWS EFS**: Provides persistent storage with separate access points for **staging** and **production**.
- **AWS ECR**: Serves as the container registry for Docker images.
- **AWS CloudWatch**: Centralized logging and metrics collection.
- **Prometheus & Grafana**: Monitors system health, performance, and alerts on anomalies.

## Monitoring & Logging
- **Grafana Dashboard**: Visualizes cluster, pod, and node health metrics in real time.
- **Prometheus**: Collects application metrics and monitors infrastructure performance.
- **AWS CloudWatch**: Aggregates logs, detects anomalies, and provides debugging insights.

## Summary
This project delivers a **highly available, scalable, and secure** infrastructure for the **Status Page** application. It follows **best practices** in security, observability, and automation, leveraging AWS services and Kubernetes to ensure a **resilient and efficient deployment pipeline**.

# Status Page Project

## Overview
This project sets up the **infrastructure and architecture** for an existing **Status Page** application on AWS. The application runs in **Kubernetes (EKS)** with a **highly available RDS (Multi-AZ)** database and utilizes **Argo CD** for continuous deployment.

## Architecture
- **CI/CD**: GitHub Actions automates testing, security scanning, and deployment.
- **Containerization**: The application runs inside a Docker container.
- **Orchestration**: Managed with **EKS** and deployed using **Argo CD**.
- **Database**: Uses **AWS RDS (Multi-AZ)** for high availability and redundancy.
- **Storage**: **AWS EFS** with separate access points for staging and production.
- **Container Registry**: Docker images are stored in **AWS ECR**.
- **Monitoring**: Integrated with **Prometheus & Grafana**.
- **Logging**: Uses **AWS CloudWatch** for centralized log management.

## Deployment Workflow
1. Developer pushes changes to GitHub.
2. GitHub Actions:
   - Builds a new Docker image.
   - Runs tests, including **curl-based health checks** and **RDS connectivity verification**.
   - Scans the image for security vulnerabilities.
   - Tags the image sequentially (e.g., version 1, version 2).
   - Pushes the image to **AWS ECR**.
3. **Argo CD** detects the new image and deploys it to the **staging namespace** in **EKS**.
4. After QA approval, Argo CD promotes the deployment to the **production namespace**.

## Infrastructure Components
- **EKS Cluster**: Manages application deployment.
- **Node Group**: Provides compute resources with access to **RDS**.
- **AWS RDS (Multi-AZ)**: Ensures high availability for the database.
- **AWS EFS**: Provides persistent storage with distinct access points for **staging** and **production**.
- **AWS ECR**: Stores Docker images.
- **AWS CloudWatch**: Collects and centralizes application logs.
- **Prometheus & Grafana**: Monitors system health and performance.

## Monitoring & Logging
- **Grafana Dashboard**: Provides real-time insights into cluster, pod, and node health.
- **Prometheus**: Collects and stores application metrics.
- **AWS CloudWatch**: Aggregates logs for debugging and performance analysis.

## Summary
This project focuses on designing and deploying a **highly available, scalable, and monitored** infrastructure for the **Status Page** application. It leverages AWS services, Kubernetes, and CI/CD automation to streamline deployment and maintenance.


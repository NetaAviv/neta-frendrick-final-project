# Status Page Project

## What is a Status Page?
A **Status Page** is a web application that provides real-time updates on the operational status of services, applications, or infrastructure. It helps users track uptime, incidents, and scheduled maintenance, ensuring transparent communication about system health. This project implements a **highly available, scalable, and secure Status Page infrastructure** on **AWS**, utilizing **Kubernetes (EKS)** and other AWS services.

---

## Project Overview
This project focuses on designing and deploying the **infrastructure and architecture** for an existing **Status Page** application on **AWS**. The deployment is fully containerized and runs on **Amazon EKS** with a **highly available RDS (Multi-AZ)** database. It incorporates **Argo CD** for continuous deployment, **GitHub Actions** for automation, and robust **monitoring and security measures** to ensure reliability and performance.

---

## Branch Structure
To maintain a structured development workflow, the project is organized into three main branches:
- **DevOps Branch**: Contains all configuration files related to Docker and Argo CD.
- **Develop Branch**: Houses the application code, ensuring developers modify only the necessary files.
- **Master Branch**: Serves as the main branch, integrating files from both **DevOps** and **Develop**.

---

## Architecture Overview
- **CI/CD Pipeline**: GitHub Actions automates testing, security scanning, and deployment.
- **Containerization**: The application is packaged using Docker.
- **Orchestration**: Managed through **Amazon EKS**, using **Argo CD** for automated deployments.
- **Database**: High availability is ensured with **AWS RDS (Multi-AZ)**.
- **Storage**: Persistent storage is provided by **AWS EFS**, with separate access points for **staging** and **production**.
- **Container Registry**: Docker images are securely stored in **AWS ECR**.
- **Monitoring & Logging**: Integrated with **Prometheus, Grafana, and AWS CloudWatch** for system insights.

---

## Security Considerations
Security is a **top priority** in this project. Key security implementations include:
- **Private Subnets for Sensitive Resources**: RDS and EKS nodes are deployed in **private subnets** to prevent unauthorized access.
- **Strict Security Group Rules**: Only necessary ports and protocols are open, reducing the attack surface.
- **Principle of Least Privilege (PoLP)**: IAM roles and policies are configured with the least privilege required.
- **Environment Segmentation**: Staging and production environments have **separate EFS access points** to prevent unintended access.
- **Automated Image Security Scanning**: Every new Docker image undergoes security scans before deployment.
- **Secret Management**: AWS Secrets Manager ensures safe storage and retrieval of sensitive credentials.

---

## Deployment Workflow
1. A developer pushes changes to GitHub.
2. **GitHub Actions** triggers an automated pipeline:
   - Builds a new Docker image.
   - Runs tests, including **health checks** and **database connectivity verification**.
   - Scans the image for vulnerabilities.
   - Tags the image sequentially (e.g., `version 1`, `version 2`).
   - Pushes the image to **AWS ECR**.
3. **Argo CD** detects the new image and deploys it to the **staging namespace** in **EKS**.
4. After successful QA testing and approval, Argo CD promotes the deployment to the **production namespace**.

---

## Infrastructure Components
- **Amazon EKS Cluster**: Manages containerized workloads.
- **Node Group**: Provides compute resources for application workloads.
- **AWS RDS (Multi-AZ)**: Ensures database **high availability and failover protection**.
- **AWS EFS**: Provides persistent storage for both **staging** and **production** environments.
- **AWS ECR**: Secure storage for Docker images.
- **AWS CloudWatch**: Centralized logging and performance metrics collection.
- **Prometheus & Grafana**: Monitors system health, performance, and detects anomalies.

---

## Monitoring & Logging
- **Grafana Dashboard**: Provides real-time visualization of cluster, pod, and node health.
- **Prometheus**: Collects and monitors infrastructure and application metrics.
- **AWS CloudWatch**: Aggregates logs for performance monitoring and troubleshooting.

---

## Summary
This project delivers a **highly available, scalable, and secure** infrastructure for the **Status Page** application. It adheres to **best practices** in security, observability, and automation while leveraging AWS services and Kubernetes for a **resilient and efficient deployment pipeline**.


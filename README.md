# Status Page Project

## Overview
This project sets up the **infrastructure and architecture** for an existing **Status Page** application on AWS. The application is containerized and deployed using Kubernetes on **AWS EKS**, with a highly available **RDS (Multi-AZ)** database.

## Architecture
- **CI/CD**: GitHub Actions automates the build and deployment process.
- **Containerization**: The application runs inside a Docker container.
- **Orchestration**: Deployed on **EKS** using **Argo CD** for continuous deployment.
- **Database**: Uses **AWS RDS (Multi-AZ)** for high availability and redundancy.
- **Container Registry**: Docker images are stored in **AWS ECR**.
- **Monitoring**: Integrated with **Prometheus & Grafana**.
- **Logging**: Uses **AWS CloudWatch**.


## Deployment Workflow
1. Developer pushes changes to GitHub.
2. GitHub Actions:
   - Builds a new Docker image.
   - Test the image using curl and RDS connectivity
   - Scans the image for security issues 
   - Tags the image sequentially (version 1, version 2, etc.).
   - Pushes the image to AWS ECR.
3. Argo CD detects the new image and deploys it to namespace **staging** in the eks cluster.
4. QA approves, and Argo CD deploys to namespace **production** in the eks cluster.

## Installation & Setup
### Prerequisites
- AWS account with necessary permissions.
- AWS CLI, kubectl, and Argo CD CLI installed.
- EKS cluster
- Node group inside the eks cluster with SG that can access the RDS
- EFS (elastic file system) with 2 access points (one for staging and the other for production) 
- RDS (Multi AZs)

### Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/status-page.git
   cd status-page
   ```
2. Deploy application:
   ```sh
   kubectl apply -f k8s-manifests/
   ```
3. Monitor the application:
   ```sh
   kubectl get pods -n production
   ```

## Monitoring & Logging
- **Grafana Dashboard**: Monitors cluster, pods, nodes, and namespace health.
- **Prometheus**: Collects application metrics.
- **AWS CloudWatch**: Stores logs for analysis.

## Contributing
Feel free to fork the repo and submit a pull request!

## License
This project is licensed under the MIT License.

## Contact
For questions or issues, open an issue in this repository or email [neta.aviv100@gmail.com](mailto:neta.aviv100@gmail.com).


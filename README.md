## Overview: AWS EKS upload a file to an S3 Bucket from a Kubernetes pod ⛴️

#### Objective: Create a Kubernetes deployment for a Python application that uploads a file to an S3 bucket.
#### Technologies: Python, boto3, Docker, Kubernetes, EKS, IRSA (IAM Roles for Service Accounts), eksctl/Terraform.

##### Highlight: This is highly useful because we will need to create an IAM IRSA (IAM role for service account) and attach it to the pod appropriately.

##### Steps:

1. [x] Create a Python application that uploads a file to an S3 bucket.
3. [x] Dockerize the application.
2. [x] Create a Kubernetes deployment for the Python application.
3. [x] Define all the required IAM services (role, policy, service account-IRSA) for the Kubernetes deployment.
4. [x] Initialize Git repository for version control.

![codesnap](https://github.com/assafdori/pod-to-s3/blob/main/k9s.png)
![codesnap](https://github.com/assafdori/pod-to-s3/blob/main/codesnap.png)



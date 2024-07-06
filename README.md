![codesnap](https://github.com/assafdori/pod-to-s3/blob/main/k9s-snap.png)

## Overview: AWS EKS upload a file to an S3 Bucket from a Kubernetes pod ⛴️

#### Objective 🎯 : Create a Kubernetes deployment for a Python application that uploads a file to an S3 bucket.

#### Highlight 💡 : This is highly useful because we will need to create an IAM IRSA (IAM role for service account) and attach it to the pod appropriately.

#### Technologies 🛠️ :
- Python 
- boto3 
- Docker
- Kubernetes
- EKS
- IAM Services (roles, policies, IRSA)
- Terraform

#### Steps 📝 :

1. [x] Create a Python application that uploads a file to an S3 bucket.  
2. [x] Dockerize the application.  
3. [x] Create a Kubernetes deployment for the Python application.  
4. [x] Define all infrastructure as code (IaC) Terraform such as VPC, EKS, S3, IAM, Node Group, etc.  
5. [x] Define all the required IAM services (role, policy, service account-IRSA) for the Kubernetes deployment.  
6. [x] Initialize Git repository for version control.  

#### Structure 🏗️ :
- **infrastructure/**: Terraform code for creating the EKS cluster, S3 bucket, IAM services, etc.  
- **kubernetes/**: Kubernetes deployment for the Python application & service account. 
- **python-app/**: Python application that uploads a file to an S3 bucket.  

#### Conclusion 📌 : This project is a great example of how to interact with AWS services from a Kubernetes pod. It is a great way to learn how to use IAM services and IRSA in Kubernetes.

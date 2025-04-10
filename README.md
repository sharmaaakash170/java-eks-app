# ☕ Java Spring Boot CI/CD with AWS EKS using Terraform, Helm & CodePipeline

This project demonstrates a **production-level CI/CD pipeline** using:
- Java Spring Boot Application
- AWS EKS (Elastic Kubernetes Service)
- Terraform for Infrastructure as Code
- Helm for Kubernetes deployment
- CodePipeline + CodeBuild for CI/CD
- ECR for Docker image storage
- S3 for pipeline artifact storage
- IAM roles for secure access
- SSM for storing GitHub token securely

---

## 🔧 Tools & Technologies Used

| Tool           | Purpose                                  |
|----------------|------------------------------------------|
| **Terraform**  | Provisioning AWS Infrastructure          |
| **EKS**        | Running the Kubernetes Cluster           |
| **ECR**        | Docker Image Storage                     |
| **Helm**       | Kubernetes App Deployment                |
| **CodeBuild**  | Docker Build and Image Push              |
| **CodePipeline**| CI/CD Workflow                          |
| **SSM**        | Secure GitHub Token Storage              |

---

## 📁 Folder Structure

```
java-eks-app/
├── java-app/               # Java Spring Boot App
├── terraform-infra/        # Terraform Code
│   ├── main.tf             # Root Module
│   └── modules/
│       ├── eks/            # EKS Cluster and Node Group
│       ├── ecr/            # ECR Module
│       ├── codebuild/      # Build Config
│       ├── codepipeline/   # Pipeline Setup
│       ├── iam/            # All IAM Roles
│       ├── helm-charts/    # Helm Chart for Java App
│       └── s3/             # Artifact Bucket
```

## 🔁 CI/CD Workflow

1. ✅ Code pushed to GitHub triggers CodePipeline
2. ✅ CodeBuild:
   - Builds JAR using Maven
   - Creates Docker Image
   - Pushes to Amazon ECR
   - Updates EKS via Helm
3. ✅ Helm deploys app to Kubernetes on EKS
---

## 🔥 Common Error Faced

### ❌ Error:
You must be logged in to the server (the server has asked for the client to provide credentials)

arduino
Copy
Edit

### ✅ Solution:
Run this locally to update your access config:
```bash
kubectl apply -f aws-auth.yaml

🚀 How to Run This Project

cd terraform-infra
terraform init
terraform apply
✅ Ensure the GitHub token is added to AWS SSM and referenced in Terraform. ✅ A Docker image will be built and pushed automatically.

---

## 🧠 Learnings

- Deploying Flask on Kubernetes using Helm.
- Managing infrastructure with Terraform.
- Setting up CI/CD pipeline with AWS services.
- Troubleshooting real-world DevOps issues.

---

## 📎 Author Links

- GitHub: [github.com/sharmaaakash170](https://github.com/sharmaaakash170)
- LinkedIn: [linkedin.com/in/aakash-sharma-8937b81aa](https://www.linkedin.com/in/aakash-sharma-8937b81aa/)


# **Complete-CI-CD-with-Terraform**

## **Project Overview**
This project demonstrates completes CICD with terraform. 

---
  
## **Feature**

### **Complete CI/CD Pipeline with DockerHub**

- Created SSH key pair for EC2 Instance
- Created Credential in Jenkins
- Installed Terraform inside Jenkins Container
- Created Terraform configuration files to provision an ec2 server
- Created entry-script.sh file to install docker, docker-compose and start containers through docker-compose command
- Adjusted Jenkinsfile to include provision and deployment stage
- Included docker login to be able to pull Docker Images from private Docker repository
- Executed CI/CD pipeline successfully
- 

### **Diagrammatic Presentation**
- Connected to the cluster

  ![image](https://github.com/user-attachments/assets/02cf7397-d6af-483d-8dd7-42ec272d289a)



- Created Deployment and Service for App deployment
- Adjust Jenkinsfile to set environment variables with envsubst

  ![image](https://github.com/user-attachments/assets/922a3233-5f4a-4dcd-b12c-78480adf62da)

- Installed “gettext-base” tool inside Jenkins Container on DigitalOcean Server to have envsubst available
- Created Secret for DockerHub Registry in EKS cluster (connect to EKS cluster if not already) and added reference to Deployment file
  
  ![image](https://github.com/user-attachments/assets/c86f5e65-6365-423b-aaed-530543719e5f)

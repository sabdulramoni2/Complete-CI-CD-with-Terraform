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
  

### **Diagrammatic Presentation**
- Created SSH key pair for EC2 Instance
- Created Credential in Jenkins
- Installed Terraform inside Jenkins Container
  ![image](https://github.com/user-attachments/assets/c63e7460-2676-4b2e-bba4-73522e7b8e2a)


- Download Terafform from the official website
  ![image](https://github.com/user-attachments/assets/b820b21f-cb27-4d82-8ed4-d97444bf7f4b)

- Run apt-get update
  ![image](https://github.com/user-attachments/assets/67220110-ece7-4cfb-91ba-92c071e386c9)

- Run the following command
  ```
      wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

      echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  ```
  




- Created Terraform configuration files to provision an ec2 server
- Created entry-script.sh file to install docker, docker-compose and start containers through docker-compose command
- Adjusted Jenkinsfile to include provision and deployment stage
  
  ![image](https://github.com/user-attachments/assets/a29efbf0-8406-4ad1-a251-141e2de38f79)

  ![image](https://github.com/user-attachments/assets/8f3709ef-7774-4168-bfff-3f93206c7b4a)

  ![image](https://github.com/user-attachments/assets/0c539491-bb5d-41d1-8517-f5760a4a5796)

  ![image](https://github.com/user-attachments/assets/5bb96015-45cb-4463-8c91-01fc2c3bda4d)



- Included docker login to be able to pull Docker Images from private Docker repository

  ![image](https://github.com/user-attachments/assets/d9c9f3fe-465a-4fc5-8810-a59c3e7535c0)

- Executed CI/CD pipeline successfully

  ![image](https://github.com/user-attachments/assets/c074f539-5b8c-4a9d-990d-7b9bc3c024f2)


  ![image](https://github.com/user-attachments/assets/dfe42338-9af8-493f-a162-502d8b3e03bf)

  ![image](https://github.com/user-attachments/assets/a614088f-a845-4dda-8591-b1837a13412b)
  
  ![image](https://github.com/user-attachments/assets/05fa23be-403c-4885-99df-046106928e7d)

  ![image](https://github.com/user-attachments/assets/9d2e8fac-c7a6-4049-a682-bf7e2d570f93)

  ![image](https://github.com/user-attachments/assets/389966e3-b324-4084-bf42-d4f2e7393971)

  ![image](https://github.com/user-attachments/assets/27513910-6066-473d-875d-1b06ef01fa73)

  ![image](https://github.com/user-attachments/assets/c5994cec-7dfb-4ab6-898e-0cbb1c67ba22)

  ![image](https://github.com/user-attachments/assets/393f03b8-df4a-4769-8aea-d8c67654257f)





  





- Ec2 created on AWS
  ![image](https://github.com/user-attachments/assets/4b276e0e-9f9c-4934-8f54-bb699ad3d539)

- Application successfully deployed on ec2 instance

  ![image](https://github.com/user-attachments/assets/ec5869f9-08f4-4cd9-84ea-a4fea9cdd84c)







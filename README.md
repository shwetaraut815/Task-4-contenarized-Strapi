*Objective*


Provision a secure AWS infrastructure using Terraform where a Strapi application runs inside Docker on a private EC2 instance, accessible only through an Application Load Balancer placed in public subnets, with outbound internet via a NAT Gateway.

<img width="1536" height="1024" alt="task-4-diagram" src="https://github.com/user-attachments/assets/26d4dbae-201e-4358-ae5f-0ce3ac7878e7" />


Loom video : https://www.loom.com/share/ca540acc9c494ecd92ed3e3e4501dc6d

*Terraform module structure*

<img width="572" height="643" alt="image" src="https://github.com/user-attachments/assets/3415e52c-a548-4536-b745-496b479a03ee" />

Traffic Flow

User → ALB (Public Subnet) → Target Group → EC2 (Private Subnet :1337) → Strapi Docker


*host strapi on ec2*

<img width="1268" height="399" alt="image" src="https://github.com/user-attachments/assets/dea119f2-22cc-48e0-b4b4-f50fc90bc152" />


Outcome

Successfully designed a custom VPC with public and private subnets using Terraform
-Deployed an Application Load Balancer across two public subnets for high availability
-Provisioned a private EC2 instance with no public IP for secure application hosting
-Configured a NAT Gateway to allow the private EC2 to pull Docker images from the internet
-Deployed the Strapi application inside a Docker container on the private EC2
-Configured Security Groups to allow traffic only from ALB to EC2 on the application port
-Implemented proper Target Group health checks to ensure application availability
-Exposed the application securely via the Load Balancer DNS without exposing the EC2 directly
-Managed environment configuration using Terraform variables and modules



*Objective*

*Creating AWS Infrastructure for Strapi App with Terraform and Docker*

Provision a secure AWS infrastructure using Terraform where a Strapi application runs inside Docker on a private EC2 instance, accessible only through an Application Load Balancer placed in public subnets, with outbound internet via a NAT Gateway.

<img width="1536" height="1024" alt="task-4-diagram" src="https://github.com/user-attachments/assets/26d4dbae-201e-4358-ae5f-0ce3ac7878e7" />




Loom video : https://www.loom.com/share/a00c84fb3a314f23baee2f1bd56d675b

*Terraform module structure*

<img width="434" height="741" alt="image" src="https://github.com/user-attachments/assets/cfab1200-4810-4ae0-a228-47709126f988" />

<img width="1570" height="596" alt="image" src="https://github.com/user-attachments/assets/7a79837e-f37f-4e55-a3cf-b31bb7045fd6" />

<img width="995" height="870" alt="image" src="https://github.com/user-attachments/assets/e4eab05f-d9b2-480e-befb-9cbfce1a42db" />

FROM node:20-alpine

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "develop"]




<img width="1881" height="538" alt="image" src="https://github.com/user-attachments/assets/97513b7a-44e1-452b-a24b-522f9fbc8267" />

<img width="1897" height="464" alt="image" src="https://github.com/user-attachments/assets/7dde621e-8ad7-4405-9717-e541206fb3c6" />

<img width="1910" height="368" alt="image" src="https://github.com/user-attachments/assets/248859ed-432a-49e5-a694-467e327527d8" />





Traffic Flow

User → ALB (Public Subnet) → Target Group → EC2 (Private Subnet :1337) → Strapi Docker


*host strapi on ec2*

<img width="1268" height="399" alt="image" src="https://github.com/user-attachments/assets/dea119f2-22cc-48e0-b4b4-f50fc90bc152" />


Outcome

-Successfully designed a custom VPC with public and private subnets using Terraform

-Deployed an Application Load Balancer across two public subnets for high availability

-Provisioned a private EC2 instance with no public IP for secure application hosting

-Configured a NAT Gateway to allow the private EC2 to pull Docker images from the internet

-Deployed the Strapi application inside a Docker container on the private EC2

-Configured Security Groups to allow traffic only from ALB to EC2 on the application port

-Implemented proper Target Group health checks to ensure application availability

-Exposed the application securely via the Load Balancer DNS without exposing the EC2 directly

-Managed environment configuration using Terraform variables and modules



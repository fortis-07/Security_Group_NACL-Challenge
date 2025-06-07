# Terraform AWS VPC Lab Project Documentation

## Table of Contents
1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Project Architecture](#project-architecture)
4. [Step-by-Step Implementation Guide](#step-by-step-implementation-guide)
5. [Verification Steps](#verification-steps)
6. [Cleanup Instructions](#cleanup-instructions)
7. [Troubleshooting](#troubleshooting)

## Project Overview
This project creates a complete AWS networking environment with:
- A custom VPC named "proj2"
- Public subnets with auto-assigned public IPs
- Two security groups (SGA and SGB) with specific rules
- Two EC2 instances (one in each security group)

## Prerequisites
- AWS account with appropriate permissions
- Terraform installed (v1.0+ recommended)
- AWS CLI configured
- Existing EC2 key pair in AWS account

## Project Architecture
![deepseek_mermaid_20250606_bc1410](https://github.com/user-attachments/assets/32eb82e4-5941-432e-a165-44a93e7b3732)


## Step-by-Step Implementation Guide

### 1. Initialize Terraform
```bash
terraform init
```
![image](https://github.com/user-attachments/assets/77fdf300-9f3c-45f0-a02d-a3c45a1cc21c)


### 2. Review Execution Plan
```bash
terraform plan
```
![image](https://github.com/user-attachments/assets/1b79b978-5161-41a6-a14a-9a0b88be9ffc)


### 3. Apply Configuration
```bash
terraform apply
```
![image](https://github.com/user-attachments/assets/e047fedd-3184-4973-8536-98f4513f952a)

### 4. Confirm Infrastructure
```
terraform state list
```
![image](https://github.com/user-attachments/assets/a88977d5-d3fa-4b92-a77d-b5275e4e7213)



## Verification Steps

### AWS Console Verification


1. **Security Groups Verification**:
   - Verify SGA and SGB rules

![image](https://github.com/user-attachments/assets/d24458cc-8810-4f18-84f7-2f8060d6f15f)


2. **EC2 Instances Verification**:
   - Check running instances and their associations

![image](https://github.com/user-attachments/assets/ce7a13f3-7e18-4b02-ad6c-aa643365c188)



## Security Group/Networking Verification

1. **Connect via a web browser to public IP each instance (should display the Apache test page)**:
```bash
 http://<instance-sga-public-ip>
```

![image](https://github.com/user-attachments/assets/36b825d6-0782-4819-8ff6-d6dce9386842)

![image](https://github.com/user-attachments/assets/1dcae306-46dc-4e1d-8719-1c1db330e04f)



2. **SSH Access Test by Connecting via EC2 instance connect and pinging Instance-SGA from Instance-SGB vice versa**:

![image](https://github.com/user-attachments/assets/d312a8ea-721f-466f-9298-ad1646c14355)

![image](https://github.com/user-attachments/assets/633a8b62-efe7-45af-91ba-2ff940489ce1)



3. **Retrieve the Apache test page on the instance in SGA from the instance in SGB using 'curl http://'**
*It returns *Instance with SGB*

![image](https://github.com/user-attachments/assets/58a8e356-3116-41db-a621-6a3e5f1ff012)



4. **Enable inbound HTTP access only from your home IP address for SGA**

 ![image](https://github.com/user-attachments/assets/8086feff-cbfc-4cdd-89b2-ad821d5fbaf1)

**Testing Modification** 
*HTTP access to Instance-SGA works*

![image](https://github.com/user-attachments/assets/5c9c259d-a221-4b52-883d-77ea194f0eaa)



5. **Use a NACL to deny traffic from your home IP**

**Testing Modifications**
All access to  instance fails (NACL blocks before SG checks)

![image](https://github.com/user-attachments/assets/8ea1fbe7-3259-4d9b-979c-aac1f46d5c73)
Error: Connection timeout (NACL is stateless firewall at subnet level)


6. **Update SGB so that it only allows HTTP from SGA**


*Testing modification by pinging from SGA*

![image](https://github.com/user-attachments/assets/16b84ee9-7fba-4657-a197-3733864c7e18)

*Testing modifications by running curl to Instance-SGB’s private IP*

![image](https://github.com/user-attachments/assets/97969c95-bb93-43d2-82b2-aec46ea9f616)



7. **Enable ICMP in both directions**

Instance-SGA can ping Instance-SGB 
![image](https://github.com/user-attachments/assets/25f1d2cb-a007-4299-8746-804c079915ac)

Instance-SGB can now ping Instance-SGA
![image](https://github.com/user-attachments/assets/6cb80ed7-dd00-443d-8728-48ac8e6f9d94)

## Cleanup Instructions
```bash
terraform destroy
```
![image](https://github.com/user-attachments/assets/b939bda3-7c52-4f78-be79-bb7fc3d86a5c)



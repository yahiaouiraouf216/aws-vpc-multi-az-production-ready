# AWS VPC Multi-AZ Architecture (SAA-C03 Portfolio Project)

## 📌 Overview

This project demonstrates the design and implementation of a secure, scalable, and highly available AWS VPC architecture using best practices aligned with AWS Solutions Architect Associate (SAA-C03).

The architecture includes public and private subnets across two Availability Zones, NAT Gateway for secure outbound access, and proper routing configuration.

---

## 🏗️ Architecture Design

### CIDR Block
- VPC CIDR: 10.0.0.0/16

### Availability Zones
- AZ-1a
- AZ-1b

---

## 🌐 Network Layout

### Public Subnets
- Public Subnet A (10.0.1.0/24) → AZ-1a
- Public Subnet B (10.0.2.0/24) → AZ-1b

### Private Subnets
- Private Subnet A (10.0.3.0/24) → AZ-1a
- Private Subnet B (10.0.4.0/24) → AZ-1b

---

## 🌍 Internet Access

- Internet Gateway attached to VPC
- NAT Gateway deployed in Public Subnet A
- Elastic IP attached to NAT Gateway

---

## 🧭 Routing Configuration

### Public Route Table
| Destination | Target |
|------------|--------|
| 0.0.0.0/0  | Internet Gateway |

### Private Route Table
| Destination | Target |
|------------|--------|
| 0.0.0.0/0  | NAT Gateway |

---

## 🔐 Security Design

### Security Groups
- Web Security Group:
  - Allow HTTP (80) from anywhere
  - Allow HTTPS (443) from anywhere
  - Allow SSH (22) from my IP only

### Principle of Least Privilege applied

---

## 🖥️ Compute Layer

### Public EC2 Instance
- Amazon Linux 2
- Apache Web Server installed
- Used for testing internet access

### Private EC2 Instance
- No direct internet access
- Access via NAT Gateway only

---

## ⚙️ User Data Script (Public EC2)

```bash
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<h1>VPC Project - Public EC2 Instance</h1>" > /var/www/html/index.html

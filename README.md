

# Terraform AWS Infrastructure Setup

## 1. VPC Resources

* **VPC**: main_vpc
* **Subnets**:

  * Public Subnet
  * Private Subnet
* **Internet Gateway**: For public internet access
* **NAT Gateway**: To allow private subnet instances to access the internet securely
* **Route Tables**:

  * Public Route Table
  * Private Route Table
* **Route Table Associations**: Associate subnets with corresponding route tables

## 2. Security Group

* **Name**: mani_sg
* **Description**: Security group for Terraform-managed instances
* **VPC**: main_vpc
* **Ingress Rules**: SSH (port 22) from anywhere (0.0.0.0/0) ipv4
* **Egress Rules**: All traffic allowed

## 3. Key Pair

* **SSH Key Generation** (optional, if not already available):

  ```bash
  ssh-keygen -t rsa -b 2048 -f <file name>
  ```
* **Key Name**: mani-key
* **Purpose**: Used to SSH into EC2 instances

## 4. EC2 Instances

### Public EC2 Instance (Jump Host)

* **AMI**: ami-0ecb62995f68bb549
* **Instance Type**: t3.medium
* **Subnet**: Public
* **Public IP**: Assigned
* **Key Pair**: mani-key

### Private EC2 Instance

* **AMI**: ami-0ecb62995f68bb549
* **Instance Type**: t2.medium
* **Subnet**: Private
* **Public IP**: Not assigned
* **Key Pair**: mani-key

## 5. Accessing EC2 Instances

* **Connect to Public EC2**:

  ```bash
  ssh -i mani-key.pem ubuntu@<PUBLIC_IP>
  ```
* **Connect to Private EC2 (via Public EC2 / Jump Host)**:

  ```bash
  ssh -i mani-key.pem -J ubuntu@<PUBLIC_PUBLIC_IP> ubuntu@<PRIVATE_IP>
  ```
* **Purpose**: Use the public EC2 as a jump host to securely access the private EC2 instance


### If Git already tracked an unwanted file, remove it using:
### Verify the files are tracked by git

# List tracked files
```
git ls-files
```

# Stop tracking files
commands
```
git rm --cached <file_name>
git rm --cached *.tfstate
git rm -r --cached <directory_name>
```

* The files are removed from GitHub (the remote repo) because Git now considers them untracked.

* Your local copies remain, so you haven’t lost anything on your machine.


# Add the following to .gitignore to prevent tracking in the future

```
*.tfstate
*.tfstate.backup
.terraform/
mani-key
mani-key.pub
crash.log
.terraform.lock.hcl
```


<!-- 
Resetting Git When History Already Exists (Windows)

If Git has already tracked the project and contains unwanted history, remove the existing .git folder.

Restart your PC to clear Windows file locks.

After reboot, open PowerShell as Administrator and run: -->

```
cd C:\WORKSPACE\Terraform-modules-wipro-25
Remove-Item -Recurse -Force .git
# or
rm -r -force .git
```

<!-- Reinitialize Git: -->
```
git init
```
<!-- If you receive a permission or remote error, reset the remote:
if you want to add another repo just remove current one or you can use 
set-url -->

```
git remote remove origin
git remote add origin https://github.com/YourName/NewRepo.git
git remote set-url origin <url>
git push -u origin main

```

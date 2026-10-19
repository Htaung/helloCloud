# CNFP1 Session 39 - Terraform Session 05 [12-Sep-2024]

Category: Terraform
Git Repositoy: https://github.com/Htaung/helloCloud/tree/main/CNFP_Session_39
Hands-on: Done
Target: August 26, 2026 → August 27, 2026
Watching: Done
Youtube: https://www.youtube.com/watch?v=MbRiYPtENZY&list=PLvzWOIc1IOtddfdvAmnPc6V4RSWHLpn7h&index=27
drawing: https://www.tldraw.com/f/BPapP_9NhebH_2vibL1nW?d=v310.-582.2706.1953.page

#### Security Group

- just for understanding will not use default security group
- one ec2, one security group
- in work, shouldn’t be use 1 ec2, 1 security group
- point to point or point to many depends on what they expect

#### Lease priviledge

- not allow unless it is necessary

To allow an EC2 instance to accept traffic only from your laptop, you must **use your public IP address provided by your internet service provider**, not your laptop's local private IP address.

**Understanding the IP Address**

- **Your Public IP Address**

When your laptop connects to the internet, your internet service provider (ISP) assigns your router a public IP address. AWS sees all traffic coming from your home or office network as originating from this public ISP-assigned address. 

- **Your Laptop's Private IP:** Your laptop has a local IP address (like `192.168.x.x` or `10.x.x.x`) on your Wi-Fi network. AWS cannot see or use this private address from the internet.

#### Before we start terraform

- we have to understand what is the manual process of creating EC2, security group,….

![CNFP1 Session 35 - Terraform Session 04 [05-Sep-2024].svg](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/CNFP1_Session_35_-_Terraform_Session_04_05-Sep-2024.svg)

#### Generate key pair in local

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image.png)

#### Key pair creating manually

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%201.png)

```
# main.tf
resource "aws_key_pair" "master-key-pair" {
  key_name   = "master-singapore-key"
  public_key = var.public_key
}

# output.tf
output "master_key_pair_id" {
  value = aws_key_pair.master-key-pair.id
}

output "master_key_pair_arn" {
  value = aws_key_pair.master-key-pair.arn
}

output "master_key_pair_key_name" {
  value = aws_key_pair.master-key-pair.key_name
}

output "master_key_pair_key_type" {
  value = aws_key_pair.master-key-pair.key_type
}

output "master_key_pair_public_key" {
  value = aws_key_pair.master-key-pair.public_key
}
```

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%202.png)

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%203.png)

```bash
terraform destroy -auto-approve
```

#### Derived public key from generated private key

```bash
ssh-keygen -y -f master-singapore-key > derived_public_key
```

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%204.png)

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%205.png)

```bash
# main.tf
resource "aws_key_pair" "master_ed25519_key" {
  key_name   = "master_ed25519_key"
  public_key = var.public_key
}

# output.tf
output "master_ed25519_key_pair_id" {
  value = aws_key_pair.master_ed25519_key.id
}

output "master_ed25519_key_arn" {
  value = aws_key_pair.master_ed25519_key.arn
}

output "master_ed25519_key_pair_name" {
  value = aws_key_pair.master_ed25519_key.key_name
}

output "master_ed25519_key_key_type" {
  value = aws_key_pair.master_ed25519_key.key_type
}

output "master_ed25519_key_public_key" {
  value = aws_key_pair.master_ed25519_key.public_key
}
```

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%206.png)

![image.png](CNFP1%20Session%2039%20-%20Terraform%20Session%2005%20%5B12-Sep-20/image%207.png)

```bash
terraform destroy -auto-approve
```
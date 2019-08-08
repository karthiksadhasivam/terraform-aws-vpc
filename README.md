# This Terraform code creates the following AWS resources.

1. VPC
2. Internet Gateway(attached to the VPC)
3. Public and Private subnets across mutiple availablity zones (NOTE: public and private subnet should be minimum 1 on each az)
4. NAT Gateway on each AZ.
5. Public and Private route tables including associating the subnet and creating routes to internet gateway and NAT gateway.
6. Create Network ACLs for Public and private subnet.(Note: ACL rules allow all by default. you can fine tune as you need)
7. Create Private endpoints for public and private subnets to talk to S3.
8. Create Virtual gateway and attach to the VPC.

To Execute this terraform code,

```
cd terraform-aws-vpc/dev
terraform init
terraform plan -out plan.out (verify all the resources gets affected)
terraform apply (say yes to proceed)
```

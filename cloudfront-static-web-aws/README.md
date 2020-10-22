# To Creat your static website follow below:
### Prerequisites:
##### * You need terraform version 12
##### * If you are running the code in your AWS EC2 make sure it has ADMIN privileges.
### Run the following commands:
#####  * Clone the repo
```
git clone https://github.com/safag05/Terraform-projects.git
```
##### * Go inside the static-web-aws folder
```
cd Terraform-projects/static-web-aws
```
##### * Edit terraform.tfvars file to your own info
```
domain_name    = "YOUR-DOMAIN-NAME"
aws_region     = "us-east-1"
route_zone_id  = "YOUR-ZONE-ID"
```
##### * Run the following commands
```
terraform init
terraform apply -var-file terraform.tfvars
```
##### * Then go into AWS S3 console and upload the index.html file into the bucket that is created.

#### You should now have a website running. 
#### Go to the URL that was specified in tfvars file and it should come up.
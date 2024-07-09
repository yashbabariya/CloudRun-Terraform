# CloudRun-Terraform
Create a New Terraform Module for Reusable Infrastructure Components

**Part 2: Second task**
* Step 1:- Enter the values in main.tf file

##### 1. VPC
```
  region                    = "<region-name>"
  project_id                = "<project-id>"
  vpc_name                  = "<vpc-name>"
  public_subnet_cidr_range  = "<cidr-range>"
  private_subnet_cidr_range = "<cidr-range>"
```
##### 2. cloudrun
```
  region                    = "<region-name>"
  project_id                = "<project-id>"
  docker_image              = "<image-name>"
  cloudrun_name             = "<cloudrun-name>"
  cloudrun_resources_cpu    = "<cpu>"
  cloudrun_resources_memory = "<memory>"
```

* Step 2:- First initializes a working directory containing Terraform configuration files.
  ```
  terraform init
  ```

* Step 3:- Check whether the configuration is valid
  ```
  terraform validate
  ```
* Step 4:- Reformat your configuration in the standard style
  ```
  terraform fmt
  ```
* Step 5:- Show changes required by the current configuration
  ```
  terraform plan
  ```
* Step 6:- Create or update infrastructure
  ```
  terraform apply
  ```
* After we got the Cloudrun URL which was accessible publicly.

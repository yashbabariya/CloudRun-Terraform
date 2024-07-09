# CloudRun-Terraform
Create a New Terraform Module for Reusable Infrastructure Components

**Part 2: Second task**
* Step 1:- C
* Step 2:- Create a Docker image and test it locally on 3000 port.
```
cd my-react-app/
```
```
docker build -t reactapp .
```
```
docker run -p 3000:3000 reactapp
```
* Step 3:- Create the GCP console account, and new projects, and enable docker registry artifacts.
* Step 4:- Push the docker image into gcr artifacts.
  ```
  docker tag reactapp asia-south1-docker.pkg.dev/task-terraform-428814/simple-app/myreactapp:v1
  ```
  ```
  docker push asia-south1-docker.pkg.dev/task-terraform-428814/simple-app/myreactapp:v1
  ```
* Step 5:- Create a "main.tf" file with Google Cloud provider configuration and run the init command.
  ```
  terraform init
  ```
* Step 6:- Create the "cloudrun.tf" file add a resource to create cloud run and get the output cloudrun URL.
* Step 7:- Check whether the configuration is valid
  ```
  terraform validate
  ```
* Step 8:- Reformat your configuration in the standard style
  ```
  terraform fmt
  ```
* Step 9:- Show changes required by the current configuration
  ```
  terraform plan
  ```
* Step 10:- Create or update infrastructure
  ```
  terraform apply
  ```
* After we got the Cloudrun URL which was accessible publicly.

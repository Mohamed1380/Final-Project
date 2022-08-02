# ITI Graduation Project
# Provision Private GKE cluster and Bastion Host on GCP Using Terraform
#### Deploy nodjs Application using jenkins pipeline [Project link] (https://github.com/mahmoud254/jenkins_nodejs_example)

# Infrastructure Resoureces on GCP
1. Make backend configuration using GCP Bucket
2. Create VPC
* subnets (management subnet & restricted subnet)
* Management subnet has the (NAT gateway , Private vm)
* Restricted subnet has the (Private standard GKE cluster (private control plan))
Notes:
1. Restricted subnet must not have access to internet
2. All images deployed on GKE must come from GCR or Artifacts registry.
3. The VM must be private.
4. Deployment must be exposed to public internet with a public HTTP load balancer.
5. All infra is to be created on GCP using terraform.
6. Deployment on GKE can be done by terraform or manually by kubectl tool.
7. Don’t use default compute service account while creating the gke cluster, create
custom SA and attach it to your nodes.
8. Only the management subnet can connect to the gke cluster.

# To run Terraform code
```
terraform init
terraform plan --var-file variables.tfvars 
terraform plan --var-file variables.tfvars
```
![My image](images/prove.png)
# authenticate with the cluster
```
gcloud container clusters get-credentials mycluster --zone us-west2-a --project abdelhadyfinal
```
```
gcloud compute ssh mymachine --project abdelhadyfinal --zone us-west2-a -- -L8888:localhost:8888
```
#### Run Kubectl using this command or do export
```
HTTPS_PROXY=localhost:8888 kubectl
## or 
export HTTPS_PROXY=localhost:8888
kubectl
```

## Deploy Kuberentes Files
```
kubectl apply -fR ./kubernetes
```

### Finally Destroy Infrastructur
```
terraform destroy --var-file variables.tfvars
```
##  jenkins deployment
-34.102.64.26:8080 
![My image](13ff02dc-4ab0-48a8-a67a-93d2e9ff0694.jpeg)


# Simple Helm Chart with Terraform managed EKS

### Create EKS with Terraform
- Initialize Terraform packages
    - `terraform init`
- Create VPC for EKS
    - `terraform apply -target=module.vpc`
    - Than fill subnet_ids to `terraform/variables.tf`
- Create IAM and EKS
    - `terraform apply`

### Pack and install Helm Charts
- Nevigate to `helm` folder
- Pack Helm charts
    - `helm package bitoex`
- Than install Helm package to cluster
    - `helm install bitoex bitoex-0.1.0.tgz`

### View result webpage
- Get ExternalIP (in this case, the domain of AWS ELB)
    - `kubectl get svc --namespace default bitoex --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}"`
- Than brose the URL on 5000 port, which a simple static web page were served.

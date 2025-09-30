# opsfleet-tech-assignment

## Prereqs

- Terraform >= 1.5  
- AWS CLI configured  
- kubectl, helm installed  

## Steps

```bash
cd terraform
terraform init
terraform apply -auto-approve



## kubeconfig
aws eks update-kubeconfig \
  --region $(terraform output -raw region) \
  --name $(terraform output -raw cluster_name)



##  Apply Karpenter configs.
kubectl apply -f ../k8s/ec2nodeclass-arm64.yaml
kubectl apply -f ../k8s/ec2nodeclass-x86.yaml
kubectl apply -f ../k8s/nodepool-arm64.yaml
kubectl apply -f ../k8s/nodepool-x86.yaml



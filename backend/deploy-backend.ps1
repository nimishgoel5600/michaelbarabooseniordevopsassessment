# Authenticate with Azure
Connect-AzAccount

# Retrieve AKS cluster credentials
az aks get-credentials --resource-group backendresource --name aksclusterbackend

# Verify connection to AKS cluster
kubectl get nodes

# Build and push Docker image for backend
docker build -t seniordevops/senior-devops-assessment-backend:latest .
docker push seniordevops/senior-devops-assessment-backend:latest

# Apply backend deployment YAML to AKS cluster
kubectl apply -f backend-deployment.yaml

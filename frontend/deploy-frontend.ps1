# Authenticate with Azure
Connect-AzAccount

# Retrieve AKS cluster credentials
az aks get-credentials --resource-group frontendresource --name aksclusterfrontend

# Verify connection to AKS cluster
kubectl get nodes

# Build Angular application
cd frontend
npm install
ng build --prod

# Build and push Docker image for frontend
docker build -t seniordevops/senior-devops-assessment-frontend:latest .
docker push seniordevops/senior-devops-assessment-frontend:latest

# Apply frontend service YAML to AKS cluster
kubectl apply -f frontend-service.yaml

# Apply frontend ingress YAML to AKS cluster
kubectl apply -f frontend-ingress.yaml

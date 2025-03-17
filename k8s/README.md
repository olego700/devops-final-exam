## Kubernetes Deployment

### Overview
Deploy the Flask application to a Kubernetes cluster using manifests in the `k8s/` directory.

### Files
- `k8s/deployment.yaml`: Defines a Deployment with 2 replicas
- `k8s/service.yaml`: Creates a LoadBalancer Service

### Deployment Steps
1. Ensure `kubectl` is configured for your cluster
2. Apply manifests:
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
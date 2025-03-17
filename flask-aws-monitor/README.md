# Helm Chart for Flask AWS Monitor

This Helm chart deploys the Flask AWS monitoring application to a Kubernetes cluster, providing a reusable and configurable deployment solution.

## Overview
The chart packages the Flask application (`olego700/flask-aws-monitor:latest`) into a Kubernetes Deployment and Service, with optional Ingress support. It’s designed for easy customization via `values.yaml` and integrates with your existing CI/CD pipelines.

## Prerequisites
- **Helm 3.x**: Install with `curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash`
- **Kubernetes Cluster**: Configured with `kubectl` (e.g., AWS EKS in `eu-west-1`)
- **Docker Image**: `olego700/flask-aws-monitor:latest` available on Docker Hub

## Chart Structure
- `Chart.yaml`: Metadata (name: `flask-aws-monitor`, version: `0.1.0`)
- `values.yaml`: Default configurations (image, ports, replicas, etc.)
- `templates/`:
  - `deployment.yaml`: Kubernetes Deployment
  - `service.yaml`: LoadBalancer Service
  - `ingress.yaml`: Optional Ingress resource

## Installation

### Steps
1. **Navigate to Chart Directory**:
   ```bash
   cd /devops-final-exam/flask-aws-monitor
   helm create flask-aws-monitor

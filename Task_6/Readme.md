# 🚀 CI/CD with GitHub Actions + Kubernetes + Argo CD  

This project demonstrates a **GitOps-based CI/CD pipeline** where:  

- Source code lives in this repo (`app-repo`).  
- Docker image is built and pushed to **Docker Hub** via **GitHub Actions**.  
- Kubernetes manifests live in a separate **infra-repo**.  
- **Argo CD** continuously syncs the cluster with the infra-repo.  

---

## 📂 Repository Structure  

**App Repository (`app-repo`)**  
```
/app-repo
├── Dockerfile
├── index.html (or app.py / server.js / etc.)
├── .github/workflows/cicd.yaml
└── README.md
```

**Infra Repository (`infra-repo`)**  
```
/infra-repo
└── Task6/k8n
    ├── deployment.yaml
    ├── service.yaml
    └── README.md
```

---

## ⚡ Workflow Overview  

1. Developer pushes code to `main` branch of `app-repo`.  
2. GitHub Actions workflow:  
   - Builds Docker image.  
   - Pushes it to Docker Hub.  
   - Updates `infra-repo/deployment.yaml` with the new image tag.  
   - Commits and pushes the change to `infra-repo`.  
3. Argo CD watches the `infra-repo`.  
4. On detecting changes, Argo CD automatically syncs and deploys the new version to Kubernetes.  

---

## 🔧 GitHub Actions Workflow  

The CI/CD pipeline is defined in `.github/workflows/cicd.yaml`:  

## 🔑 Required Secrets  

Set the following in your GitHub repository → **Settings → Secrets and Variables → Actions**:  

- `DOCKER_USERNAME` → your Docker Hub username  
- `DOCKER_PASSWORD` → your Docker Hub password/token  
- `RM_TOKEN` → a GitHub Personal Access Token (PAT) with **repo permissions** to push to `infra-repo`  

---

## 🛠️ Kubernetes & Argo CD Setup  

###  Create a kind Cluster  
```bash
kind create cluster --name xops-cluster
kubectl get nodes
```

### 2️⃣ Install Argo CD  
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get pods -n argocd
```

###  Access Argo CD UI  
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Open → https://localhost:8080  

Default user: `admin`  
Password:  
```bash
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
```

###  Create Argo CD Application  
`app.yaml`:
Apply it:
```bash
kubectl apply -f app.yaml
```
## Screenshots 


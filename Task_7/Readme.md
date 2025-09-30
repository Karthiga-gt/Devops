# Kubernetes Secrets — XOps Microchallenge #7

## Included files
- `secret-env-pod.yaml` — Pod that consumes secret as environment variables
- `secret-vol-pod.yaml` — Pod that mounts secret as files (volume)
- `README.md` — This file

---

# Environment Variables vs Mounted Files in Kubernetes Secrets

**Environment Variables**
- Best for small, simple values (like DB username or password).
- Easy for applications to consume.
- Risk: values can appear in logs, crash dumps, or debugging sessions.
- Secret values are loaded when the pod starts — updating the Secret does **not** automatically update running pods (pod restart required for env var change).

**Mounted Files**
- Secrets are written as files inside the container (e.g., `/etc/secrets/DB_USER`).
- Useful for certificates, keys, or larger configuration values.
- Kubernetes can update the files automatically if the Secret changes (no pod restart needed in many cases).
- Slightly more work for the app because it must read from files rather than env vars.

---

## 🛠️ Step-by-Step Execution

> The commands below include Windows PowerShell and Linux/WSL variants where applicable.

### Prerequisites
- Docker Desktop (recommended driver for Minikube)
- Minikube installed and in PATH
- kubectl installed and in PATH
- PowerShell (Windows) or bash (Linux/WSL)

---

### Install Minikube (Windows example — add these content)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-windows-amd64.exe
rename minikube-windows-amd64.exe minikube.exe
move minikube.exe C:\Windows\System32

### Start Minikube
# Start with Docker driver (Windows: run from PowerShell if Docker Desktop present)
minikube start --driver=docker
kubectl get nodes

### Create secret via PowerShell 
kubectl create secret generic db-credentials --from-literal=username=myuser --from-literal=password=mypassword

### Deploy Pod that uses Secret as Environment Variables
kubectl apply -f secret-env-pod.yaml
kubectl get pods

### Deploy Pod that mounts the Secret as Files
kubectl apply -f secret-vol-pod.yaml
kubectl get pods

### Verify the proces
kubectl exec -it secret-vol-pod -- ls /etc/secrets
kubectl exec -it secret-vol-pod -- cat /etc/secrets/username
kubectl exec -it secret-vol-pod -- cat /etc/secrets/password

### Screenshots

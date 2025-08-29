# XOps Task 5 – Kubernetes with kind
 
## Objective
Deploy a local Kubernetes cluster with kind and serve a custom NGINX page.
 
## Project Structure
```
/kubernetes-xops-task5
├── README.md
├── index.html
├── app.yaml
```
 
## Steps
1. **Create Cluster**
```powershell
kind create cluster --name xops-cluster
kubectl get nodes
```
2. **Create ConfigMap**
```powershell
kubectl create configmap xops-web-content --from-file=index.html
```
3. **Deploy App**
```powershell
kubectl apply -f app.yaml
kubectl get pods,svc
```
4. **Access App**
```powershell
kubectl port-forward deployment/xops-web 1221:80
```
Visit: `http://localhost:1221`

## Kubernetes Components

* **API Server**: Handles REST requests.
* **Scheduler**: Assigns Pods to nodes.
* **Controller Manager**: Maintains cluster state.
* **etcd**: Key-value cluster store.
* **kubelet**: Node agent managing Pods.
* **kube-proxy**: Handles networking and service routing.
 
## Clean Up
```powershell
kind delete cluster --name xops-cluster
```
Screenshots:
<img width="1919" height="1006" alt="Screenshot 2025-08-28 115024" src="https://github.com/user-attachments/assets/d5b96ed8-56f3-4961-b6bf-262a271fe617" />
<img width="1913" height="1000" alt="Screenshot 2025-08-28 114841" src="https://github.com/user-attachments/assets/c0309f65-397a-44c2-b062-9b69dd9b57c0" />

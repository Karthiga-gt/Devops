# ConfigMaps vs Secrets in Kubernetes
ConfigMaps -> are used for non-sensitive configuration data such as app modes, feature flags, or environment settings. They make applications more portable by keeping configuration separate from container images.

Secrets -> are used for sensitive data like database passwords, API keys, or TLS certificates. Unlike ConfigMaps, their values are base64-encoded and can be encrypted at rest, with stricter RBAC access.
## 🔹 ConfigMaps
- Used for **non-sensitive configuration** like environment settings, feature flags, or app properties.
- Example: `APP_MODE=dev`, `FEATURE_X_ENABLED=true`.
- Can be injected into Pods as:
  - **Environment variables**
  - **Mounted files**

## 🔹 Secrets
- Used for **sensitive data** such as DB passwords, API keys, TLS certs.
- Values are base64-encoded (not encrypted by default).
- Require RBAC + encryption at rest for better security.

## Best Practices 
- **Never store sensitive data in ConfigMaps**.
- Use **Secrets for passwords, tokens, and keys**.
- Encrypt Secrets at rest and restrict RBAC permissions.
- Mount ConfigMaps and Secrets as files if the app expects config files.
- Keep configs separate from code for flexibility.

## 🚀 Demo Steps
1. Create ConfigMap → Inject as env + mounted files.
2. Create Secret → Inject as env.
3. Verified via `kubectl exec`.

## 📸 Screenshots
- Pod environment variables showing `APP_MODE=dev`
- Mounted `/etc/config/APP_MODE` and `FEATURE_X_ENABLED`
  <img width="1486" height="575" alt="Screenshot 2025-09-30 123052" src="https://github.com/user-attachments/assets/3ae7aacb-cebf-4bd8-95b3-218f80ef3d4d" />

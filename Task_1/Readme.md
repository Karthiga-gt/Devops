# XOps Static Web Page Project
 
## Overview
 
This project contains a simple, designed HTML page that displays:
 
---
 
## Files
 
- **index.html**  
  Contains the HTML code for the XOps welcome page.
 
- **style.css**
  Contains the CSS code for the XOps welcome page.
 
- **DockerFile**  
  Defines instructions to build a Docker image using [Nginx](https://nginx.org/) on Alpine Linux to serve the static HTML page.
 
---
 
## How the DockerFile Works
 
```dockerfile
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY . .
EXPOSE 80
```
 
---
## To Build and Run
 
1. **Build the Docker Image**  
   Open a terminal in the project directory and run:
   ```bash
   docker build -t xops-welcome-page .
   ```
2. **Run the Docker Container**  
   After the image is built, run the container with:
   ```bash
   docker run -d -p 8080:80 xops-welcome-page
   ```
   ---
3. **Access the Page**  
   Open a web browser and navigate to `http://localhost:8080` to view the XOps welcome page.
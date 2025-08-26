# Use an official Nginx image as the base
FROM nginx:alpine

# Copy custom HTML file into Nginx's public directory
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css

# Expose port 80
EXPOSE 80

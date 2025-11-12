# Use official Nginx image from Docker Hub
FROM nginx:alpine

# Copy website files into Nginx's default public directory
COPY . /usr/share/nginx/html

# Expose port 80 (default HTTP)
EXPOSE 80

# Start Nginx (this is already the default CMD)
CMD ["nginx", "-g", "daemon off;"]

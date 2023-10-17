# Use an official Nginx base image
FROM nginx

# Copy the contents of the "dist" folder to the default Nginx public directory
COPY dist/ /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 8080

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

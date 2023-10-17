# Use an official Nginx base image
FROM nginx

# Copy the contents of the "dist" folder to the default Nginx public directory
COPY dist/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
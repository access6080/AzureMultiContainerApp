# Use an official Nginx runtime as the base image
FROM nginx:latest

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the contents of the 'client' folder into the container at /usr/share/nginx/html
COPY . .

# Expose port 80 to the host machine
EXPOSE 80

# Command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]

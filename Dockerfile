# Use an official NGINX image as the base
FROM nginx:latest

# Install git to clone the repository
RUN apt-get update && apt-get install -y git

# Define a build argument to accept the GitHub repository URL
ARG REPO_URL

# Copy clone_repo script to /usr/bin/
COPY clone_repo.sh /usr/bin/clone_repo

# Clone the git repository passed as a build argument
RUN clone_repo ${REPO_URL}

# Remove the default NGINX configuration file and replace it with your custom config
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

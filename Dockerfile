# Use Nginx to serve the static index.html
FROM nginx:alpine

# Copy the custom identity verification page to the default Nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8080 (App Engine Flexible expects this by default)
EXPOSE 8080

# Configure Nginx to listen on 8080 instead of 80
RUN sed -i 's/listen \(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

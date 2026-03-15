FROM httpd:2.4

# Remove default Apache website
RUN rm -rf /usr/local/apache2/htdocs/*

# Copy your webapp files into Apache server directory
COPY src/main/webapp/ /usr/local/apache2/htdocs/

# Expose Apache port
EXPOSE 80

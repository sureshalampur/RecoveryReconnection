# -------- Stage 1: Build using Maven --------
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build project
RUN mvn clean package -DskipTests


# -------- Stage 2: Run with Apache HTTPD --------
FROM httpd:2.4

# Remove default Apache content
RUN rm -rf /usr/local/apache2/htdocs/*

# Copy web files to Apache server
COPY src/main/webapp/ /usr/local/apache2/htdocs/

# Expose port
EXPOSE 80

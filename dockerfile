# Use httpd as base image
FROM httpd:latest

# Install unzip and curl commands
RUN apt-get update && \
    apt-get install -y unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/local/apache2/htdocs/

# Download and unzip developer code
RUN curl -o halloween.zip https://linux-devops-course.s3.amazonaws.com/halloween.zip && \
    unzip halloween.zip && \
    mv halloween/* . && \
    rm -rf halloween.zip halloween

# Create a volume called "saves"
VOLUME /usr/local/apache2/htdocs/saves

# (Optional) Copy custom configuration file if needed
# COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

# Expose port 80
EXPOSE 80

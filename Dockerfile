# Use a large, general-purpose base image
FROM ubuntu:latest

# Install everything in one layer without cleaning up
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    nodejs \
    npm \
    vim

# Add the entire local directory into the image, including potential secrets
ADD . /app

# Set working directory
WORKDIR /app

# Install Python packages globally (not in a virtualenv)
RUN pip3 install -r requirements.txt

# Expose port unnecessarily
EXPOSE 22

# Run the app as root
CMD ["python3", "app.py"]


# Use the official Ubuntu image from Docker Hub as the base image
FROM ubuntu:latest


# Update the package list and install essential packages
RUN apt-get update && apt-get install -y \
    supervisor \
    curl \
    vim \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libpq-dev \
    libssl-dev \
    zlib1g-dev \
    && apt-get clean

# Create a non-root user and group
RUN adduser --system --disabled-password --group status-page

# Set up the working directory inside the container
WORKDIR /opt/status-page

# Ensure the non-root user can write to this directory
RUN mkdir -p /opt/status-page/venv && chown -R status-page:status-page /opt/status-page

# Switch to the non-root user
USER status-page

# Create the virtual environment during the build stage
RUN python3 -m venv /opt/status-page/venv

# Copy the application code
COPY --chown=status-page:status-page . /opt/status-page

# Expose the application port
EXPOSE 8001

# Run upgrade script (ensure it exists in the app directory)
CMD ["/bin/bash", "-c", "/opt/status-page/upgrade.sh"]

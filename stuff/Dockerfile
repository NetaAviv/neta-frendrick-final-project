# Use the official Ubuntu image from Docker Hub as the base image
FROM ubuntu:latest


# Update the package list and install essential packages
RUN apt-get update && apt-get install -y \
    systemctl \
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

# Set the working directory inside the container
WORKDIR /opt

# Optional: Copy local files into the container (adjust paths as needed)
COPY opt .

#Expose the application port (Gunicorn typically runs on 8000)
EXPOSE 8000
#add user
RUN adduser --system --group status-page

# # Install redis
# RUN apt-get update && apt-get install -y redis-server

# # Install redis server
# RUN redis-server &

# # #start upgrade file
# RUN status-page/upgrade.sh
# # # Add the superuser creation script
# RUN echo '#!/bin/bash \n\
# source status-page/venv/bin/activate \n\
# cd status-page/statuspage \n\
# python3 manage.py createsuperuser --noinput --username admin --email admin@example.com --password Aa123456' > /usr/local/bin/create_superuser.sh \
#      && chmod +x /usr/local/bin/create_superuser.sh

# # Create a superuser during build time (uncomment to automatically create)
# RUN bash /usr/local/bin/create_superuser.sh

# RUN cp status-page/contrib/gunicorn.py /status-page/gunicorn.py
# RUN cp -v status-page/contrib/*.service /etc/systemd/system/  
# RUN systemctl daemon-reload
# RUN systemctl start status-page status-page-scheduler status-page-rq
# RUN systemctl enable status-page status-page-scheduler status-page-rq

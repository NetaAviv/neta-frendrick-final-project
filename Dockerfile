FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    python3-venv \
    libpq-dev \
    gcc \
    curl \
    nano \
    vim \
    redis-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

#Set the working directory inside the container
WORKDIR /app

#Copy application files (Make sure to add a .dockerignore file to exclude unnecessary files)
COPY Status-Page /app

#Create a virtual environment and install dependencies
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

#Expose the application port (Gunicorn typically runs on 8000)
EXPOSE 8000

#Set entrypoint for the container
#CMD ["./venv/bin/gunicorn", "-b", "0.0.0.0:8000", "status_page.wsgi:application"]

RUN adduser --system --group status-page
RUN bash upgrade.sh

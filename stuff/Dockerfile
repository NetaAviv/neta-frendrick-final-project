# Use the official Ubuntu image from Docker Hub as the base image
FROM ubuntu:latest

# Update the package list and install essential packages
RUN apt-get update && apt-get install -y \
    supervisor \
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

# Expose the application port (Gunicorn typically runs on 8001)
EXPOSE 8001

# Add user
RUN adduser --system --group status-page
RUN chown -R status-page:status-page /opt

USER status-page


# Set up Python 3 virtual environment
RUN python3 -m venv /opt/status-page/venv

# Ensure 'python' points to python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy the requirements.txt file from the correct location to the container
COPY stuff/opt/status-page/requirements.txt /opt/status-page/

# Install dependencies inside the virtual environment
RUN /opt/status-page/venv/bin/pip install --upgrade pip
RUN /opt/status-page/venv/bin/pip install -r /opt/status-page/requirements.txt

# Set the virtual environment as default
ENV PATH="/opt/status-page/venv/bin:$PATH"

# Start the application (Adjust with your entrypoint, you can also use supervisor if needed)
CMD ["/bin/bash", "-c", "source /opt/status-page/venv/bin/activate && python /opt/status-page/statuspage/manage.py collectstatic --noinput && chmod -R 755 /opt/status-page/statuspage/static && export PYTHONPATH=/opt/status-page/statuspage && gunicorn -c /opt/status-page/gunicorn.py statuspage.wsgi:application"]

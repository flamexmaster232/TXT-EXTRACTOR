# Use Alpine-based Python image
FROM python:3.9.6-alpine3.14

# Install required system packages using apk (Alpine package manager)
RUN apk update && apk add --no-cache \
    git \
    curl \
    ffmpeg \
    aria2 \
    bash \
    build-base \
    libffi-dev \
    openssl-dev \
    musl-dev \
    gcc

# Upgrade pip
RUN pip install --upgrade pip

# Copy Python dependencies file
COPY requirements.txt /requirements.txt

# Install Python packages
RUN pip install --no-cache-dir -r /requirements.txt

# Create app directory
RUN mkdir /EXTRACTOR
WORKDIR /EXTRACTOR

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the bot
CMD ["/bin/bash", "/start.sh"]

# Use slim Debian-based Python image
FROM python:3.11-slim

# Install system packages needed to build and run dependencies
RUN apt update && apt install -y \
    git \
    curl \
    ffmpeg \
    aria2 \
    bash \
    build-essential \
    libffi-dev \
    libssl-dev \
    gcc \
    g++ \
    python3-dev \
    libarrow-dev \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements.txt
COPY requirements.txt /requirements.txt

# Install Python packages
RUN pip install --no-cache-dir -r /requirements.txt

# Create app directory
RUN mkdir /EXTRACTOR
WORKDIR /EXTRACTOR

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run your bot
CMD ["/bin/bash", "/start.sh"]

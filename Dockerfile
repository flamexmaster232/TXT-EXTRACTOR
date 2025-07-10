FROM python:3.11-slim

# Install system dependencies
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
    && apt clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements file
COPY requirements.txt /requirements.txt

# Install key data packages first (as binaries)
RUN pip install --only-binary=:all: numpy pandas pyarrow

# Install remaining requirements
RUN pip install -r /requirements.txt

# Create working directory
RUN mkdir /EXTRACTOR
WORKDIR /EXTRACTOR

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start the bot
CMD ["/bin/bash", "/start.sh"]

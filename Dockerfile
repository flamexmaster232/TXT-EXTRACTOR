# Base image
FROM python:3.9-slim

# System dependencies
RUN apt update && apt install -y \
    git \
    ffmpeg \
    curl \
    gcc \
    g++ \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask port
EXPOSE 8080

# Start the bot and web server
CMD ["python", "main.py"]

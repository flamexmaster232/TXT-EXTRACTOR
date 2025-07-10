FROM python:3.11-slim

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

RUN pip install --upgrade pip

# Clone your repo during build
RUN git clone https://github.com/flamexmaster232/TXT-EXTRACTOR.git /TXT-EXTRACTOR

# Install core data packages first
RUN pip install --only-binary=:all: numpy pandas pyarrow

# Install all requirements from repo
RUN pip install -r /TXT-EXTRACTOR/requirements.txt

WORKDIR /TXT-EXTRACTOR

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/bin/bash", "/start.sh"]

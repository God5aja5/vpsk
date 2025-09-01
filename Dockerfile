FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Step 1: Update and install basic dependencies
RUN apt-get update -o Acquire::Retries=3 && \
    apt-get install -y \
    curl wget nano bash build-essential cmake git \
    software-properties-common tmux pkg-config libjson-c-dev libwebsockets-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Step 2: Try installing ttyd from APT
RUN apt-get update && (apt-get install -y ttyd || \
    (echo "ttyd not found in repo, building from source..." && \
    git clone https://github.com/tsl0922/ttyd.git /tmp/ttyd && \
    cd /tmp/ttyd && mkdir build && cd build && \
    cmake .. && make && make install))

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose ttyd web UI on port 8080
EXPOSE 8080

CMD ["/start.sh"]

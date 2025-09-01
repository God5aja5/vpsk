FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update -o Acquire::Retries=3 && \
    apt-get install -y \
    curl wget nano bash build-essential cmake git \
    software-properties-common tmux pkg-config libjson-c-dev libwebsockets-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install ttyd (from source if not available)
RUN apt-get update && (apt-get install -y ttyd || \
    (echo "Building ttyd from source..." && \
    git clone https://github.com/tsl0922/ttyd.git /tmp/ttyd && \
    cd /tmp/ttyd && mkdir build && cd build && \
    cmake .. && make && make install))

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port
EXPOSE 8080

CMD ["/start.sh"]

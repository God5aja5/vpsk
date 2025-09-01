FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install essentials and ttyd + tmux
RUN apt-get update && apt-get install -y \
    curl wget nano bash build-essential cmake git \
    ttyd tmux \
    && rm -rf /var/lib/apt/lists/*

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]

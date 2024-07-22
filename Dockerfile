FROM ubuntu:latest

# Install necessary packages
RUN apt update -y && \
    apt install -y fortune-mod cowsay netcat-openbsd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH
ENV PATH="/usr/games:${PATH}"

WORKDIR /usr/local/bin/

# Copy the scripts
COPY wisecow.sh .

# Make sure the scripts are executable
RUN chmod +x wisecow.sh

# Use ENTRYPOINT to run the start script
ENTRYPOINT ["./wisecow.sh"]

EXPOSE 4499

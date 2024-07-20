FROM ubuntu:latest

# Install necessary packages
RUN apt-get update -y && \
    apt-get install -y fortune-mod cowsay && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH
ENV PATH="/usr/games:${PATH}"

WORKDIR /usr/local/bin/

# Copy the script
COPY wisecow.sh .

# Make sure the script is executable
RUN chmod +x wisecow.sh

# Command to run the script
CMD ["./wisecow.sh"]

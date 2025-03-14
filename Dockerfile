# Use the orthuk/ardupilot-sitl image as the base
FROM orthuk/ardupilot-sitl

# Install missing dependencies (C compiler, build tools, Python, etc.)
USER root
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    clang \
    make \
    git \
    rsync \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/*

# Set user back if required
USER docker  # Remove if the container should run as root

# Declare build arguments with default values
ARG VEHICLE_TYPE=ArduCopter
ARG FRAME=quad
ARG LAT=0.0
ARG LON=0.0
ARG ALT=0.0
ARG HEADING=0.0
ARG CONNECTION_TYPE=udp
ARG REMOTE_IP=127.0.0.1
ARG PORT=14550
ARG NON_INTERACTIVE=

# Set environment variables based on build arguments
ENV VEHICLE_TYPE=${VEHICLE_TYPE} \
    FRAME=${FRAME} \
    LAT=${LAT} \
    LON=${LON} \
    ALT=${ALT} \
    HEADING=${HEADING} \
    CONNECTION_TYPE=${CONNECTION_TYPE} \
    REMOTE_IP=${REMOTE_IP} \
    PORT=${PORT} \
    NON_INTERACTIVE=${NON_INTERACTIVE}

# Set the working directory
WORKDIR /home/docker/ardupilot

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

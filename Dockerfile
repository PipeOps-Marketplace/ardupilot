# Use the orthuk/ardupilot-sitl image as the base
FROM orthuk/ardupilot-sitl

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

USER root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


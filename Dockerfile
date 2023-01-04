FROM debian:stable-slim

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    liblz4-tool \
    jq \
    curl \
    ca-certificates \
 && apt-get autoremove -y


# update permissions & change user to not run as root
WORKDIR /app
RUN chgrp -R 0 /app && chmod -R g=u /app
USER 1001


FROM debian:jessie

LABEL maintainer="mas9612 <mas9612@gmail.com>"

RUN apt-get -y update && apt-get -y install curl
RUN export CLOUD_SDK_REPO="cloud-sdk-jessie" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get -y install google-cloud-sdk openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /gcloud
WORKDIR /gcloud

VOLUME /root/.config
VOLUME /root/.ssh

ENTRYPOINT ["/usr/bin/gcloud"]

# Environment to run helm package
FROM ubuntu:18.04

ARG HELM_VERSION=v2.14.3

ENV HELM_FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV HELM_URL https://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME}

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https curl ca-certificates software-properties-common \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/$HELM_FILENAME ${HELM_URL} && \
  tar -zxvf /tmp/${HELM_FILENAME} -C /tmp && \
  mv /tmp/linux-amd64/helm /bin/helm && \
  rm -rf /tmp && \
  /bin/helm init --client-only

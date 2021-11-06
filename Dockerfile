FROM golang:1.17.3-bullseye

ARG OPERATOR_SDK_VERSION
ENV OPERATOR_SDK_VERSION=${OPERATOR_SDK_VERSION:-1.14.0}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates=20210119 \
        curl=7.74.0-1.3+b1 \
        gcc=4:10.2.1-1 \
        git=1:2.30.2-1 \
        make=4.3-4.1 && \
    apt-get clean

# hadolint ignore=DL3059
RUN curl -Lo /usr/local/bin/operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/v${OPERATOR_SDK_VERSION}/operator-sdk_linux_amd64 && \
    chmod 755 /usr/local/bin/operator-sdk

ENTRYPOINT ["operator-sdk"]

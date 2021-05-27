FROM golang:1.16.4-alpine3.13

ARG OPERATOR_SDK_VERSION
ENV OPERATOR_SDK_VERSION=${OPERATOR_SDK_VERSION:-1.7.2}

RUN apk add --no-cache \
        bash=5.1.0-r0 \
        ca-certificates=20191127-r5 \
        curl=7.77.0-r0 \
        gcc=10.2.1_pre1-r3 \
        git=2.30.2-r0 \
        make=4.3-r0 \
        musl-dev=1.2.2-r0

# hadolint ignore=DL3059
RUN curl -Lo /usr/local/bin/operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/v${OPERATOR_SDK_VERSION}/operator-sdk_linux_amd64 && \
    chmod 755 /usr/local/bin/operator-sdk

ENTRYPOINT ["operator-sdk"]

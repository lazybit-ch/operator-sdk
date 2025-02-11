FROM golang:1.17.3-alpine3.14

ARG OPERATOR_SDK_VERSION
ENV OPERATOR_SDK_VERSION=${OPERATOR_SDK_VERSION:-1.14.0}

RUN apk add --no-cache \
        bash=5.1.4-r0 \
        ca-certificates=20191127-r5 \
        curl=7.79.1-r0 \
        gcc=10.3.1_git20210424-r2 \
        git=2.32.0-r0 \
        make=4.3-r0 \
        musl-dev=1.2.2-r3

# hadolint ignore=DL3059
RUN curl -Lo /usr/local/bin/operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/v${OPERATOR_SDK_VERSION}/operator-sdk_linux_amd64 && \
    chmod 755 /usr/local/bin/operator-sdk

ENTRYPOINT ["operator-sdk"]

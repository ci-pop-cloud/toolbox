FROM python:3.7-alpine

ARG ANSIBLE_VERSION

LABEL org.opencontainers.image.source https://github.com/pop-cloud/pop-box

# Bash and tools
RUN apk --no-cache --update add \
        bash \
        jq \
        make \
        git \
        openssh-client \
        ca-certificates \
        curl \
        openssl \
        libc6-compat \
        coreutils \
        gnupg
# Notes:
# libc6-compat is needed for azcopy to work on alpine
# coreutils is needed to fix the date command on alpine

# Compilation tools for python modules
RUN apk --no-cache add \
        sshpass \
        gcc \
        libffi-dev \
        musl-dev \
        openssl-dev \
        python3-dev \
        cargo

# Python tools (Ansible, AWS CLI)
RUN pip install --upgrade pip && \
        pip install --upgrade \
        ansible==${ANSIBLE_VERSION} \
                ansible-vault \
                ansible-lint \
                netaddr openshift awscli jmespath \
        && rm -rf .cache/pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

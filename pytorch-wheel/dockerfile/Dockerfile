FROM ubuntu:20.04
ARG PYTHON_VERSION

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install -y python${PYTHON_VERSION} && \
    apt install -y curl git python${PYTHON_VERSION}-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python${PYTHON_VERSION} get-pip.py

RUN rm -rf `which python` && \
    rm -rf `which python3` && \
    ln -s `which python${PYTHON_VERSION}` /usr/bin/python && \
    ln -s `which python${PYTHON_VERSION}` /usr/bin/python3


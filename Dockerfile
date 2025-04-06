FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-distutils \
    curl \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

CMD ["python3.10"]

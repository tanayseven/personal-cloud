FROM gocd/gocd-agent-ubuntu-18.04:v20.8.0
USER root
RUN apt-get update
RUN apt-get install -y \
    vim \
    iputils-ping \
    ca-certificates-java
RUN update-ca-certificates -f
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
USER go


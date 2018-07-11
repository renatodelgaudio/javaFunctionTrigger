FROM microsoft/azure-functions-base:dev-nightly

RUN apt-get update && \
    apt-get install -y default-jdk
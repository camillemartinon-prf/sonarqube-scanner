FROM ubuntu:22.04

# We fix sonar version
ENV SONAR_SCANNER_VERSION 4.7.0.2747
ENV DEBIAN_FRONTEND=noninteractive

# We install the basics
RUN apt-get -y update && \
    apt-get install -y curl unzip nodejs npm python3 && \
    rm -rf /var/lib/apt/lists/*

# Download and install the scanner
RUN curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
RUN unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
ENV PATH="/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin:${PATH}"

# Entrypoint
ENTRYPOINT ["sonar-scanner"]
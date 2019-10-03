FROM ubuntu:18.04

# We fix sonar version
ENV SONAR_SCANNER_VERSION 3.3.0.1492

# We install the basics
RUN apt-get -y update
RUN apt-get install -y curl unzip nodejs npm python3

# Download and install the scanner
RUN curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
RUN unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
ENV PATH="/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin:${PATH}"

# Entrypoint
ENTRYPOINT ["sonar-scanner"]
